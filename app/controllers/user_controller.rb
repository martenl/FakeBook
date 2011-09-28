class UserController < ApplicationController
   def search
    @users = User.find_by_sql(["SELECT * FROM users u WHERE u.name || u.familyname LIKE ?",'%'+params[:name]+'%'])
  end
  def show
    if params[:id] == nil
      params[:id] = session[:user_id] 
    end
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(:name =>params[:name],:familyname => params[:familyname],:email => params[:email],:password => params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect_to :action => :show, :id => @user.id
    else
      redirect_to :action => :register
    end
  end

  def register
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password = params[:password]
      session[:user_id] = @user.id
      redirect_to :action => :show
    else
      redirect_to root_path
    end
    
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def edit
  end
  
  def list
    @users = User.order("id ASC")
  end
  
  def destroy
    User.delete(params[:id])
    redirect_to :action => :show
  end
  
  def friends
    @user = User.find(params[:id])
    @friends = @user.friends
    if request.xhr?
      render :layout => false
    end
  end

 
end
