class RecruiterjobpostController < ApplicationController
 before_action :login_required
  def new
      
  end
  	
  def recruiterjobpost

 if @current_user.present?
       logger.info("In recruiterProfile #{@current_user.id}")
        params[:ids] = @current_user.id
       
       #@recruiterjobpost = Recruiter.where(:id => params[:ids] ).first
      # logger.info("In recruiterProfile #{@recruiterjobpost}")
     # @recruiter= Recruiter.where(:users_id => params[:ids]).first
     

  
end
      @recruiter = Recruiter.where(:users_id => @current_user.id).first
 @jobsposted = JobListing.where(:recruiters_id => @recruiter.id)
 @applicantscount=JobApplication.where(:job_listings_id =>@jobsposted.ids)
end
  def create

  	@recruiterjobpost =JobListing.new(recruiterjobpost_params)
		#raise "#{params.to_json}"
            if @recruiterjobpost.save
              #logger.info "khbdsf"
            	 redirect_to '/recruiter/recruiterprofile'

            else
    	        render 'new'
            end
  end





  private
  def recruiterjobpost_params
  	params.require(:recruiterjobpost).permit(:recruiters_id,:job_title,:job_type,:job_location,:job_category,:job_description,
  		:compensation,:company_name,:website,:company_description,:linkedin_link,:phone_number,:email)

  end	
end
