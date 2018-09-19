
class JobSeekerController < ApplicationController
before_action :login_required
#before_action :myfunction
  def new
 
  end

def create
	#raise "#{params.to_json}"
  #logger.info("sdfgbhgf")

		@job_seeker=Job_seeker.new(params.require(:job_seeker).permit(:users_id,:address,:phone_number,:dob,:preffered_job_type,:preffered_role,:prefferd_industry,:preffered_location,:preffered_organisation,:current_salary,:expected_salary,:linkedin_link,:skype_id,:profile_title,:profile_description,:carreer_aspiration))
	#	logger.info("dsfggggggfd")
  
            @experiance_detail=ExperianceDetail.new(params.require(:job_seeker).permit(:organisation_name,:place,:start_date,:end_date,:designation,:work_description))
            @education_detail=EducationDetail.new(params.require(:job_seeker).permit(:graduation,:course_name,:fromdate,:todate,:university,:place,:grade))
            @skillset=Skillset.new(params.require(:job_seeker).permit(:sill_name))
            @assignment=Assignment.new(params.require(:job_seeker).permit(:images_link,:videos_link,:assignment_description))
            @available_date=AvailableDate.new(params.require(:job_seeker).permit(:internfrom,:internto,:projectfrom,:projectto,:fulltimefrom))
             @languages_known=LanguageKnown.new(params.require(:job_seeker).permit(:english,:spanish,:scotish))
            if @job_seeker.save
               @experiance_detail.job_seekers_id = @job_seeker.id
                @experiance_detail.save
                @education_detail.job_seekers_id = @job_seeker.id
                @education_detail.save
                @skillset.job_seekers_id = @job_seeker.id
                @skillset.save
                @assignment.job_seekers_id = @job_seeker.id
                @assignment.save
                @available_date.job_seekers_id = @job_seeker.id
                @available_date.save
                @languages_known.job_seekers_id = @job_seeker.id
                @languages_known.save
              redirect_to '/job_seeker/studentprofile/', notice:'job_seeker profile created'

            else
    	        render 'new'
            end

	end
  def studentprofile
   # raise "#{current_user.id}"
    if @current_user.present?
     logger.info("In StudentProfile #{@current_user.id}")
     if params[:id].present?
      params[:ids] = params[:id]
      
     else
     params[:ids] = @current_user.id
     end
      @student= Job_seeker.where(:users_id => params[:ids]).first

     #@jobseekerid = Job_seeker.find_by(params[:id])
      @studentdetails = User.where(:id => params[:ids]).first
      @studentsskill=Skillset.where(:job_seekers_id => @student.id).first
  
      @studentsexperience=ExperianceDetail.where(:job_seekers_id => @student.id).all

      @studentseducation=EducationDetail.where(:job_seekers_id => @student.id).all

      @studentsavailable=AvailableDate.where(:job_seekers_id => @student.id).all

      @studentslanguage=LanguageKnown.where(:job_seekers_id => @student.id).all

@applicant = JobApplication.where(:job_seekers_id => @student.id, :status => 'active')
@shortlist=Shortlist.where(:job_seekers_id => params[:job_seekers_id])
  end
end


def edit

  @jobseeker=Job_seeker.where(:users_id => @current_user.id).first
  @student= Job_seeker.where(:users_id => params[:ids]).first
  @studentslanguage=LanguageKnown.where(:job_seekers_id => @student.id).first
  @studentsskill=Skillset.where(:job_seekers_id => @student.id).first
      @studentsexperience=ExperianceDetail.where(:job_seekers_id => @student.id).first
      @studentseducation=EducationDetail.where(:job_seekers_id => @student.id).first
      @studentsavailable=AvailableDate.where(:job_seekers_id => @student.id).first
@studentsassignment=Assignment.where(:job_seekers_id => @student.id).first



end
def update

 

  @jobseeker=Job_seeker.where(:id => params[:id]).first
 #logger.info "#{@jobseeker}"

   @education_detail = EducationDetail.where(:job_seekers_id => @jobseeker.id).first

     @experiance_detail = ExperianceDetail.where(:job_seekers_id => @jobseeker.id).first
     @skillset = Skillset.where(:job_seekers_id => @jobseeker.id).first
     @assignment = Assignment.where(:job_seekers_id => @jobseeker.id).first
     @available_date = AvailableDate.where(:job_seekers_id => @jobseeker.id).first
     @languages_known = LanguageKnown.where(:job_seekers_id => @jobseeker.id).first
  if @jobseeker.update(params.require(:jobseeker).permit(:users_id,:address,:phone_number,:dob,:preffered_role,:prefferd_industry,:preffered_location,:preffered_organisation,:preffered_job_type,:current_salary,:expected_salary,:linkedin_link,:skype_id,:profile_title,:profile_description,:carreer_aspiration))
  
          @experiance_detail.update(params.require(:jobseeker).permit(:organisation_name,:place,:start_date,:end_date,:designation,:work_description)) 
           @education_detail.update(params.require(:jobseeker).permit(:graduation,:course_name,:fromdate,:todate,:university,:place,:grade))
            @skillset.update(params.require(:jobseeker).permit(:sill_name))
           @assignment.update(params.require(:jobseeker).permit(:images_link,:videos_link,:assignment_description))
            @available_date.update(params.require(:jobseeker).permit(:internfrom,:internto,:projectfrom,:projectto,:fulltimefrom))
             @languages_known.update(params.require(:jobseeker).permit(:english,:spanish,:scotish))
            # if @jobseeker.update
               # @experiance_detail.job_seekers_id = @jobseeker.id
              #@experiance_detail.update


             #  @education_detail.job_seekers_id = @jobseeker.id
              #  @education_detail.update
             #   @skillset.jobseekers_id = @jobseeker.id
             #   @skillset.update
             #   @assignment.jobseekers_id = @jobseeker.id
             #   @assignment.update
             #   @available_date.jobseekers_id = @jobseeker.id
             #   @available_date.update
             #   @languages_known.jobseekers_id = @jobseeker.id
              #  @languages_known.update
              redirect_to '/job_seeker/studentprofile/', notice:'job_seeker profile created'

            else
              render 'new'
            end
     
# end

end

def applieddetails
@applieddetails=JobApplication.joins([:job_listing]).where(:job_seekers_id => params[:job_seeker_id],:status => 'active')
render :partial => 'appliedmodal'
  
end



#@applieddetails=JobApplication.joins(:job_listing).where(:job_applications_id => params[:job_applications_id])
#render :partial => 'appliedmodal'

end
