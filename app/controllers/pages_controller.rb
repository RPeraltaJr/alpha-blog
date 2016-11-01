# Extends Cass
class PagesController < ApplicationController
  
  def home
    redirect_to articles_path if logged_in? # Home page redirects to articles page if logged in
  end
  
  def about
    
  end
  
end