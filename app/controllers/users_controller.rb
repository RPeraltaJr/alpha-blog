class UsersController < ApplicationController 
  def new
    @user = User.new # new user instance
  end
  
  def create
    @user = User.new(user_params) 
    if @user.save
      flash[:success] = "Welcome to the Alpha Blog #{@user.username}"
      redirect_to articles_path # redirect to articles listing page
    else
      render 'new' # go back to 'new' template
    end
  end
  
  private 
    def user_params # able to create new user with username, email, password
      params.require(:user).permit(:username, :email, :password)
    end
end