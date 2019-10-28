class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates_presence_of :user_name
    validates :password,
                length: {minimum: 6},
                if: -> {new_record? || !password.nil?}
end
