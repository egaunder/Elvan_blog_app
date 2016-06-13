class User < ActiveRecord::Base 
  has_many :articles

  # will lowercase the email before saving
  before_save { self.email = email.downcase }

  validates :username, presence: true, 
            length: { minimum: 3, maximum: 25 },
            uniqueness: { case_sensitive: false }
  
  # pass in valid regex to check if email is valid
  VALID_EMAIL_REGEX= /\A[w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
end