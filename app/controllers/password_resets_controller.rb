class PasswordResetsController < ApplicationController
def new

  end



def create

  user = User.find_by_email(params[:email])
  logger.info("hhhhh")
  respond_to do |format|
    if user
  user.send_password_reset 
   logger.info("hhhhh")
    msg={:msg=> "invalid email address",:status=>"success",:data=>user}
     format.html  #{ redirect_to @user, notice: 'User was successfully created.' }
      format.json  { render :json => msg}
    else
       msg={:msg=> "invalid email address",:status=>"failed"}
      format.html  #{ redirect_to @user, notice: 'User was successfully created.' }
      format.json  { render :json => msg}
end
end
end


def edit
  @user = User.find_by_password_reset_token(params[:id])
end

def update
  @user = User.find_by_password_reset_token!(params[:id])
  if @user.password_reset_sent_at < 2.hours.ago
    redirect_to new_password_reset_path, :alert => "Password &crarr; 
      reset has expired."
  elsif @user.update_attributes(user_params)
    redirect_to root_url, :notice => "Password has been reset."
  else
    render :edit
  end
end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password,)
    end
end
