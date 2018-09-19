class UserController < ApplicationController
before_action :set_auth
    def new
      @user=User.new

  end

  def create
    @user = User.new(user_params)
    
      respond_to do |format|
        if @user.save 

      UserMailer.registration_confirmation(@user).deliver_now
      format.html  { redirect_to @user, notice: 'User was successfully created.' }
      format.json  { render :json => @user}

    else
      format.html #{ redirect_to '/', notice: "#{@user.errors.to_json} User was not successfully created." }
      format.json  { render :json => @user, status: :unprocessable_entity, notice: 'user invalid' }
    end
     #if @user.save
       
      #  UserMailer.registration_confirmation(@user).deliver_now
       # flash[:success]="Registration completed! please confirm your email address."
        #redirect_to root_url
      #else
        #flash[:error]="failure : something went wrong..."
       # render 'user/new'
    end
                  #redirect_to '/user/show' 
                 #session[:user_id]=@user.id
              #if params[:user][:roles] == 'job_seeker'
                
              #redirect_to '/job_seeker/new/'
              #else 
              #redirect_to '/recruiter/new'
                #end

      

  end


    def confirm_email
    user = User.find_by_confirm_token(params[:token])
   
    if user.present?
      
      user.email_activate
      flash[:success] = 'welcome to scothunt,your account is now confirmed'
      
      redirect_to root_url
 
    else
      flash[:error] ='user does not exist'
      redirect_to root_url
    end

  end

  def edit
     @user = User.find(params[:id])
     if params[:user][:roles] == 'job_seeker'
         redirect_to '/job_seeker/new/'
         else 
         redirect_to '/recruiter/new'
         end
     end
 private

    def set_auth
         @auth = session[:omniauth] if session[:omniauth]
    end

  def user_params
    params.require(:user).permit(:roles, :first_name, :last_name, :email, :password, :mobile_num, :university_name,:organisation_name,:designation )
  end
    
end
