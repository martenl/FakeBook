class FriendshiprequestController < ApplicationController
  
  def show
    puts "Showing..."
    render :nothing => "true",:status => "200"
  end
  
  def accept
    @user = User.find(params[:to])
    @friendshiprequest = @user.received_friendshiprequests.where("from_id = ?",params[:from]).first
    if @friendshiprequest != nil
      @friendship1 = Friendship.create(:to_id => params[:to],:from_id => @friendshiprequest.from_id)
      @friendship2 = Friendship.create(:to_id => @friendshiprequest.from_id,:from_id => params[:to])
      @friendshiprequest.destroy
     render :text => "okay", :content_type => 'text/plain'
    else
      render :text => "okay", :content_type => 'text/plain'
    end
  end

  def offer
      #create new friendshiprequest
     @unique = Friendshiprequest.where("to_id = ? AND from_id = ?",params[:to],params[:from])
     if @unique.length == 0
       @friendshiprequest = Friendshiprequest.create(:from_id => params[:from],:to_id => params[:to])
       render :text => "okay", :content_type => 'text/plain'
     else
       render :text => "exists already", :content_type => 'text/plain'
     end   
  end

  def list
    @frs = Friendshiprequest.all
    @friends = Friendship.all
  end
  
  def kill
    @frs = Friendshiprequest.find(params[:id])
    @killed = "false"
    if @frs != nil
      @killed = "true"
      @frs.destroy
    end
    
  end

end
