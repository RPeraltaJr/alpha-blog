class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  def current_user
    # return @current_user, if not then find (this prevents multiple hits to database)
    @current_user ||= User.find(session[:user_id]) if session[:user_id] # return this User if there is a user_id in session Hash
  end
  
  def logged_in?
    !!current_user # return true if there is a current_user, otherwise return false
  end
  
  def require_user
    if !logged_in? # if user is not logged in
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path # redirect user to the root path
    end
  end
end
