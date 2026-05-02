class Team < ApplicationRecord
    has_many :users
    
    VALID_NAME_REGEX = /\A[A-Za-z0-9]*\z/
    validates :name,  presence: true, length: { maximum: 50 },
        format: { with: VALID_NAME_REGEX }
 
end