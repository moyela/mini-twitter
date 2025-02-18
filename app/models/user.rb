class User < ApplicationRecord
    has_secure_password
    has_many :tweets, dependent: :destroy
    before_save { email.downcase!; username.downcase! }

    validates :username, presence: true, length: { minimum: 3, maximum: 25 },
                                         uniqueness: true
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i                  
    validates :email, presence: true, length: { maximum: 255 },
                                      format: { with: VALID_EMAIL_REGEX },
                                      uniqueness: true

    validates :password, presence: true, length: { minimum: 6 }

    def feed
        Tweet.where("user_id = ?", id) 
    end 
end
