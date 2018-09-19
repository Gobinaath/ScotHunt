class Profile < ApplicationRecord
  
	attr_accessor :password
	validates :firstname, :lastname, :email,presence: true ,uniqueness: true
	validates :password ,:university,:undergraduation ,presence: true
	validates :mobilenumber ,presence: true ,uniqueness: true
    validates :password , confirmation: true

    before_save :encrypt_password
    after_save :clear_password
 def encrypt_password
  if password.present?
    self.salt = BCrypt::Engine.generate_salt
    self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
  end
end
def clear_password
  self.password = nil
end

def self.aunthenticate(email="",login_password="")
  if user = Profile.find_by_email(email)
  end

  crypt_password = match_password(login_password, user.salt)

     if user && crypt_password == user.encrypted_password
      return user
    else
      return false
    end
  end

  def self.match_password(login_password, salt)
     encrypted_password =BCrypt::Engine.hash_secret(login_password, salt)
   end


end
