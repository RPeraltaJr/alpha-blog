class ArticlesController < ApplicationController
  # make sure the methods call 'set_article' before anything
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def index
    # @articles = Article.all # get all articles from the database
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @article = Article.new # '@' used when it is an instance variable
  end
  
  def edit
    @article = Article.find(params[:id]) # find 'id' from the params hash
  end
  
  def create
    @article = Article.new(article_params) # pass in a variable
    @article.user = User.first
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
      params.require(:article).permit(:title, :description)  # permit the values of title and description
    end
    
end