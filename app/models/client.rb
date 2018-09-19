class Client < ApplicationRecord
	def self.sign_in_from_omniauth(auth)
		if Client.find_by(provider: auth['provider'],uid: auth['uid']).present?
        client = Client.find_by(provider: auth['provider'],uid: auth['uid'])
		Client.where(:uid => "#{client["uid"]}")
			
		else
		create_user_from_omniauth(auth)
	end
	 
	end

	def self.create_user_from_omniauth(auth)

		client = Client.create [
			      provider: auth['provider'],
			      uid: auth['uid'],
			      name: auth['info']['name']
       			]
   Client.where(:uid => "#{client["uid"]}")
	end
	#def self.session_details.map(&:id)
	  
	 # raise "hello" 
 	 #self.client.map(&:id)
  	#end
end