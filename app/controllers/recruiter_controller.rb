class RecruiterController < ApplicationController
  before_action :login_required
  def new

  end

def recruiterprofilecreation


end

def create
  
    @recruiter=Recruiter.new(params.require(:recruiter).permit(:users_id,:organisation_name,:designation,:name,:email,:mobilenumber,:linkedin_link,:photo))
    
            if @recruiter.save
              #logger.info "khbdsf"
               redirect_to '/recruiter/recruiterprofile/', notice:'recruiter profile created'

            else
              render 'new'
            end

  end

 def recruiterprofile
   # raise "#{current_user.id}"
    if @current_user.present?
      
        params[:ids] = @current_user.id
     # @recruiter= Recruiter.where(:users_id => params[:ids]).first
      @recruiter = Recruiter.where(:users_id => @current_user.id).first

     @jobsposted = JobListing.where(:recruiters_id => @recruiter.id)

    @studentapplied =JobListing.where(:recruiters_id => @recruiter.id).all
    @applicantscount=JobApplication.where(:job_listings_id =>@jobsposted.ids)
          
  end
end
def edit

  @recruiter=Recruiter.where(:users_id => @current_user.id).first
 #@recruiter = User.where(:id => @current_user.id).first


end
def update
  @recruiter=Recruiter.where(:id => params[:id]).first


  if @recruiter.update(params.require(:recruiter).permit(:users_id,:organisation_name,:designation,:name,:email,:mobilenumber,:linkedin_link,:photo))
  
       redirect_to '/recruiter/recruiterprofile/', notice:'recruiter profile created'
            else
              render 'new'
            end
end


def search
conditions = ""
#:job_category => params[:job_category],:job_location => params[:job_location] , :job_type => params[:job_type]
if params[:preffered_role].present?
  conditions << "preffered_role = '#{params[:preffered_role]}' AND "
end
if params[:preffered_location].present?
  conditions << " preffered_location = '#{params[:preffered_location]}' AND "
end
if params[:expected_salary].present?
  conditions << "expected_salary = '#{params[:expected_salary]}' AND "
end
if params[:job_type].present?
  conditions << "preffered_job_type = '#{params[:prefferd_job_type]}' AND "
end
#@recruiter = Recruiter.where(:users_id => @current_user.id).first

#conditions << " job_listings.recruiters_id = '#{@recruiter.id}' AND "

@studentsearch = Job_seeker.joins([:user]).where("#{conditions[0..-6]}")

render :partial=>'studentsearchmodal'

end


def applicantdetails
@applicantdetails=JobApplication.joins(job_seeker: [:user]).where(:job_listings_id => params[:job_listings_id])
render :partial => 'applicantmodal'
  
end
def shortlist
   @recruiter=Recruiter.where(:users_id => @current_user.id).first
  # @doshortlist=Shortlist.where(:recruiters_id => @recruiter.id)
   #if @doshortlist.present?
    #raise("already shortlisted")

 
@shortlist=Shortlist.where(:job_seekers_id => params[:job_seekers_id],:recruiters_id => @recruiter.id)
  respond_to do |format|
if @shortlist.save
    format.html  { redirect_to job_seeker/studentprofile, notice: 'User was successfully created.' }
      format.json  { render :json => @shortlist}
else
 raise("wrong")
  end
end
end



end
