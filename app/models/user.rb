class User < ApplicationRecord
  attr_accessor :password
  has_one :job_seeker 

before_create :confirm_token
  validates :first_name, :last_name, presence: true 
  validates :mobile_num,presence: true ,uniqueness: true
    validates :password , confirmation: true
    validates :email,
             presence: true,
             format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, 
             uniqueness: true
   before_create { generate_token(:auth_token) }
    before_save :encrypt_password
    after_save :clear_password

 def encrypt_password
  if password.present?
    self.salt = BCrypt::Engine.generate_salt
    self.encrypted_password= BCrypt::Engine.hash_secret(password,salt)
  end
end
def clear_password
  self.password = nil
end
  
def self.aunthenticate(email="",password="")
  user = User.find_by_email(email)
  
  crypt_password = match_password(password, user.salt)

     if user && crypt_password == user.encrypted_password 
      return user
    else
      return false
    end
  end

  def self.match_password(password, salt)
     encrypted_password =BCrypt::Engine.hash_secret(password, salt)
   end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save
  end

  # def to_s
   # "#{first_name} #{last_name}"
    #end
 def confirm_token
  self.confirm_token = "#{Time.now.to_i}_#{self.first_name}"
  end

 def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
  end

 def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def self.sign_in_from_omniauth(auth)
    if User.find_by(provider: auth['provider'],uid: auth['uid']).present?
        client = User.find_by(provider: auth['provider'],uid: auth['uid'])
    User.where(:uid => "#{client["uid"]}")
      
    else
    create_user_from_omniauth(auth)
  end
   
  end

  def self.create_user_from_omniauth(auth)

    client = User.new({provider: auth['provider'],
            uid: auth['uid'],
            name: auth['info']['name']
          })
            
            client.save(:validate => false)
            
   User.where(:uid => "#{client["uid"]}")
  end
end
