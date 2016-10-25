class ArticlesController < ApplicationController
  
  def new
    @article = Article.new # '@' used when it is an instance variable
  end
  
  def create
    # render plain: params[:article].inspect # display
    @article = Article.new(article_params) # pass in a variable
    @article.save
    redirect_to_articles_show(@article)
  end
  
  private 
    def article_params
      params.require(:article).permit(:title, :description)  # permit the values of title and description
    end
    
end