class ApplicationController < ActionController::Base
 
 protect_from_forgery  with: :null_session

#protect_from_forgery with: :null_session, if: ->{request.format.json?}

     #, if: Proc.new { |c| c.request.format == 'application/json' }

  private

  def login_required
 @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] 

if @current_user.present?
	logger.info( "current_user id is #{@current_user.id}")
	   params[:ids] = @current_user.id
    @studentname = User.where(:id => params[:ids]).first
 @recruiterjobpost = User.where(:id => params[:ids]).first

 #@student= Job_seeker.where(:users_id => params[:ids]).first
 # @studentslanguage=LanguageKnown.where(:job_seekers_id => @student.id).first
  #@studentsskill=Skillset.where(:job_seekers_id => @student.id).first
   #   @studentsexperience=ExperianceDetail.where(:job_seekers_id => @student.id).first
    #  @studentseducation=EducationDetail.where(:job_seekers_id => @student.id).first
     # @studentsavailable=AvailableDate.where(:job_seekers_id => @student.id).first
#@studentsassignment=Assignment.where(:job_seekers_id => @student.id).first

else

  end

end
	#private
    
    #def myfunction
  

 #end
end