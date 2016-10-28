class UsersController < ApplicationController 
  def index
    @users = User.all
  end
  
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
  
  def edit
    @user = User.find(params[:id]) # find 'id' from the params hash
  end
  
  def update 
    @user = User.find(params[:id])
    if @user.update(user_params) # update user according to params hash
      flash[:success] = "Your account was successfully updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  def show 
    @user = User.find(params[:id]) # find user based on id
  end
  
  private 
    def user_params # able to create new user with username, email, password
      params.require(:user).permit(:username, :email, :password)
    end
end