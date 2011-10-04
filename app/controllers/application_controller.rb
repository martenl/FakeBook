class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def authenticate
    redirect_to root_url unless session[:user_id] != nil
  end
  
end
