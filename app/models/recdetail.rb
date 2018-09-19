class Recdetail < ApplicationRecord
	attr_accessor :password
	validates :firstname, :lastname, :email, :password, presence: true
    validates :mobilenumber ,presence: true 
	validates :password , confirmation: true
	validates :password_confirmation , presence: true

	before_save :encrypt_password
	after_save :clear_password

	private
	def encrypt_password
		if password.present?
			 self.salt = BCrypt::Engine.generate_salt
        self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
	end

	def clear_password
		self.password = nil;
	end


end
