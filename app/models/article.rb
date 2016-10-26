class Article < ActiveRecord::Base
  
  validates :title, presence: true, length: { minimum: 3, maximum: 50 } # enforces before creating object, ensures there is a title 
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  
end