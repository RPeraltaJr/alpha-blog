class SessionsController < ApplicationController

  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase) # find user's email by parameter email
    if user && user.authenticate(params[:session][:password]) # authenticate method to find if password is matches
      session[:user_id] = user.id # store the user's id in the session hash
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login information" # flash.now; same template
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil # Empty out session hash
    flash[:success] = "You have logged out" 
    redirect_to root_path # go to home page
  end
  
end
