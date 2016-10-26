class User < ActiveRecord::Base
  
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
  
end