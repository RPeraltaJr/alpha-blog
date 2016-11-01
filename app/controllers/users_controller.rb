class UsersController < ApplicationController 
  before_action :set_user, only: [:edit, :update, :show] # assign 'set_user' method for only these methods []
  before_action :require_same_user, only: [:edit, :update] # make sure it is corresponding/same user accessing their profile
  
  def index
    # @users = User.all
    @users = User.paginate(page: params[:page], per_page: 5)
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
    ##
  end
  
  def update 
    ##
    if @user.update(user_params) # update user according to params hash
      flash[:success] = "Your account was successfully updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  def show 
    ##
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5) # paginate user articles within @user_articles index
  end
  
  private 
    def user_params # able to create new user with username, email, password
      params.require(:user).permit(:username, :email, :password)
    end
    def set_user
      @user = User.find(params[:id]) # find 'id' from the params hash
    end
    def require_same_user
      if current_user != @user
        flash[:danger] = "You can only edit your own account"
        redirect_to root_path
      end
    end
end