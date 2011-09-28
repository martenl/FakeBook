class MessageController < ApplicationController
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
    name = params[:receiver].split
    @receivers = User.where("name = ? AND familyname = ?",name[0],name[1])
    if @receivers.length == 1
      @receiver = @receivers.first
    else
      redirect_to :action => :write
    end
    @message.sender = @sender
    @message.receiver = @receiver
    @message.title = params[:title]
    @message.body = params[:text]
    if @message.save
      redirect_to :controller => :user,:action => :show,:id => session[:user_id]
    else
      redirect_to :action => :write
    end
  end

  def list
    @user = User.find(session[:user_id])
    @messages = @user.received_messages
  end

end
