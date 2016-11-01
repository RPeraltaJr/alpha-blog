class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy # since user is the One side, in the One to Many Associations. 'Dependent' will destory any related articles if User is destroyed
  before_save { self.email = email.downcase }
  before_save { self.username = username.capitalize}
  
  # ensure username is present
  validates :username, 
            presence: true, 
            uniqueness: { case_sensitive: false },# username with 'jo' and 'Jo' not allowed
            length: { minimum: 3, maximum: 25 } 
    
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX } # checks for valid format
            
  has_secure_password
end