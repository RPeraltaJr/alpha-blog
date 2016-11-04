class Category < ActiveRecord::Base
  has_many :article_categories #sets up connection
  has_many :articles, through: :article_categories # sets up relation with articles (through article_categories)
  
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name # ensure that the name is unique
end