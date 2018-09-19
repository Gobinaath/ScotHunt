class SessionController < ApplicationController
	 def new
  end

  def create

  authorized_user =User.aunthenticate(params[:login][:email],params[:login][:password])


 #raise "#{params.to_json}"successfully
 respond_to do |format|
  if authorized_user
  
  if authorized_user.roles == "job_seeker"

    @jobseeker = Job_seeker.where(:users_id => authorized_user.id).first
    if @jobseeker.present?
      redirect = "joseekerdashboard"
    else
      redirect ="nil"
    end

  else
    @recruiter = Recruiter.where(:users_id => authorized_user.id).first
    if @recruiter.present?
      redirect = "recruiterdashbord"
    else
      redirect ="nil"
    end

  end

   msg={:msg=>"your account is activated",:status=>"success",:data=>authorized_user, :is_redirect => redirect}
    		
        if authorized_user.email_confirmed
          format.html #{ redirect_to '/job_seeker/new/', notice: 'User was successfully created.' }
          format.json  { render :json =>msg} 

			#	if params[:remember_me]
		#		cookies.permanent[:auth_token] = authorized_user.auth_token
		

    session[:user_id] = authorized_user.id
    logger.info("user id :#{session[:user_id]}")

    	#	else
				#cookies[:auth_token] = authorized_user.auth_token  
			#	end
      
	  		#if params[:login][:roles] == 'job_seeker'
	  		#redirect_to '/job_seeker/new/', notice:'logged in!,please create your profile'
	  		#else
	  		#	redirect_to '/recruiter/new', notice:'logged in!please create your profile'
	  		#end

	  	else
        #logger.info("fkjm:")
        # flash.now[:alert] = 'Error while sending message!'
#           logger.info("fghjwada:")
      
       msg={:msg=>"please activate your account",:status=>"failed"}
      #flash[:error] = 'please activate your account'
        format.html #{ redirect_to '/job_seeker/new/', notice: 'User was successfully created.' }
      format.json  { render :json => msg}
      end 
    
  else

         msg={:msg=>"user invalid",:status=>"invalid"}
      #flash[:error] = 'please activate your account'
        format.html #{ redirect_to '/job_seeker/new/', notice: 'User was successfully created.' }
      format.json  { render :json => msg}
     
    	
end
  end
end
  def destroy
  session[:user_id]=nil
    redirect_to root_url
  end
end
