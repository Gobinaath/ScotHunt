class HomeController < ApplicationController
	before_action :set_auth
	def index
	# client = Client.find_by_id(session[:user_id])
		end

	def destroy
       redirect_to root_url
	end

private
    def set_auth
         @auth = session[:omniauth] if session[:omniauth]
    end
end