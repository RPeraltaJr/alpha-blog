class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:edit, :update, :show, :destroy] # make sure the methods call 'set_article' before anything
  before_action :require_user, except: [:index, :show] # make sure user is logged in
  before_action :require_same_user, only: [:edit, :update, :destroy] # only user who created their own article
  
  def index
    # @articles = Article.all # get all articles from the database
    # @articles = Article.paginate(page: params[:page], per_page: 5)
    # @articles = @articles.paginate(page: params[:page], per_page: 5)
    
    if params[:search] # For more information visit http://www.rymcmahon.com/articles/2
      @articles = Article.search(params[:search]).paginate(page: params[:page], per_page: 12)
    else
      @articles = Article.paginate(page: params[:page], per_page: 12)
    end
  end
  
  def new
    @article = Article.new # '@' used when it is an instance variable
  end
  
  def edit
    @article = Article.find(params[:id]) # find 'id' from the params hash
  end
  
  def create
    @article = Article.new(article_params) # pass in a variable
    @article.user = current_user # There will be a current_user variable assigned (from Application Controller) already once they get to Create Article page
    if @article.save
      flash[:success] = "Article was successfully created" # Flash message
      redirect_to article_path(@article) # according to `rake routes` which says the Prefix is 'article'
    else
      render 'new' # render 'new' template
    end
  end
  
  def update
    @article = Article.find(params[:id]) # find 'id' from the params hash
    if @article.update(article_params) # update article according to 'id' from params hash
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def show 
    @article = Article.find(params[:id]) # find 'id' from the params hash
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  private 
    def set_article # create a method for lines of code that are repeatedly used
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description, category_ids: [])  # permit the values of title and description. category_ids is in array format to pick up multiple values
    end
    def require_same_user
      if current_user != @article.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own articles"
        redirect_to root_path
      end
    end
end