class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence:   true, length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    VALID_PHONE_REGEX = /\A\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*\z/
    validates :phone, presence: true, length: { maximum: 20},
        format: {with: VALID_PHONE_REGEX}
    validates :age, presence: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    
    admin = false
    defined?(admin) or admin = true

    belongs_to :team, optional: true

    # Returns the hash digest of the given string.
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end