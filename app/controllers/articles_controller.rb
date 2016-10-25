class ArticlesController < ApplicationController
  
  def new
    @article = Article.new # '@' used when it is an instance variable
  end
  
  def create
    # render plain: params[:article].inspect # display
    @article = Article.new(article_params) # pass in a variable
    
    if @article.save
      flash[:notice] = "Article was successfully created" # Flash message
      redirect_to article_path(@article) # according to `rake routes` which says the Prefix is 'article'
    else
      render 'new' # render 'new' template
    end
  end
  
  def show 
    @article = Article.find(params[:id]) # find 'id' from the params hash
  end
  
  private 
    def article_params
      params.require(:article).permit(:title, :description)  # permit the values of title and description
    end
    
end