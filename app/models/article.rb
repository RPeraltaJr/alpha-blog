class Article < ActiveRecord::Base
  belongs_to :user # Since article is the Many, in the One to Many Associations
  has_many :article_categories  #sets up connection
  has_many :categories, through: :article_categories # sets up relation with categories (through article_categories)
  
  validates :title, presence: true, length: { minimum: 3, maximum: 50 } # enforces before creating object, ensures there is a title 
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :user_id, presence: true # ensures it has user id
  
  def self.search(search)
    if search
      losearch = search.downcase
      where("lower(title) LIKE ? OR lower(description) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%") 
    end
  end
  
end