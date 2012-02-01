class MessageController < ApplicationController
  
  before_filter :authenticate
  
  def summary
    if params[:format] = "pdf"
      @msg = "pdf"
    else
      @msg = "html"
    end
   respond_to do |format| 
     format.html 
     format.pdf { prawnto :prawn=>{:page_layout=>:landscape},:inline => true  }     
   end 
   
  end
  
  def read
    @user = User.find(session[:user_id])
    @msgs = @user.received_messages.where("messages.id = ?",params[:id])
    if @msgs != nil && @msgs.length == 1
      @msg = @msgs.first
      @msg.unread = false
    else
      redirect_to :controller => :message,:action => :list
    end
  end
  
  def write
    @name = ""
    if params[:id] != nil
      @name = User.find(params[:id]).get_name
    end
  end

  def writeWork
    @message = Message.new
    @sender = User.find(session[:user_id])
    @receivers = User.find_by_sql(["SELECT * FROM users u WHERE u.name ||' '|| u.familyname = ?",params[:receiver]])
    if @receivers.length == 1
      @receiver = @receivers.first
    else
      if request.xhr?
        render :text => "fehler", :content_type => 'text/plain'
      else
        redirect_to :action => :write 
      end
    end
    @message.sender = @sender
    @message.receiver = @receiver
    @message.title = params[:title]
    @message.body = params[:text]
    if @message.save
      redirect_to :controller => :user,:action => :show,:id => session[:user_id]
    else
      if request.xhr?
        render :text => "fehler", :content_type => 'text/plain'
      else
        redirect_to :action => :write 
      end
    end
  end

  def list
    @user = User.find(session[:user_id])
    @messages = @user.received_messages
  end
end
