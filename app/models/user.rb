class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false, message: "is already taken." }
    validates :email, uniqueness: { case_sensitive: false, message: "is already taken." }  


end
