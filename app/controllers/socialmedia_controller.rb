class SocialmediaController < ApplicationController
	def create
		auth = request.env["omniauth.auth"]
		session[:omniauth] = auth.except('extra')
		client = User.sign_in_from_omniauth(auth)
		#raise "HELLO "
		#logger.info("HELLO #{client}")
  #raise "#{client["uid"]}"
		#clients = Client.session_details(client)
		#	if clients 
		
		#logger.info("yogrrtttttttttttttttttttttttt #{client}")

		#logger.info("client id :#{client.ids}")
		logger.info(client.ids)	
		# => raise "fvds#{client}"
				  session[:user_id] = client.ids#map(&:id)
				  logger.info("HELLO #{session[:user_id]}")
					redirect_to '/job_seeker/new'#, notice: "SIGNED IN"
				
						
		 
     end#raise "#{client.uid}"
	def destroy

		session[:user_id] = nil
		session[:omniauth] = nil
		redirect_to root_url, notice: "SIGNED OUT"
	end
end


