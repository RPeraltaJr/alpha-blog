class Article < ActiveRecord::Base
  belongs_to :user # Since article is the Many, in the One to Many Associations
  
  validates :title, presence: true, length: { minimum: 3, maximum: 50 } # enforces before creating object, ensures there is a title 
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :user_id, presence: true # ensures it has user id
  
end