class ApplyjobController < ApplicationController
before_action :login_required
def apply
    if @current_user.present?

        @job_applications=JobApplication.new()
        @job_applications.job_seekers_id = Job_seeker.where(:users_id => @current_user.id).first.id
        @job_applications.job_listings_id = params[:job_listing_id]



        @job_applications.apply_date=Date.today.to_s
        @job_applications.status="active"
        respond_to do |format|

        if @job_applications.save

            format.json{ render :json => @job_applications}

        end
    end
    
 end
end
def save
if @current_user.present?

@job_applications=JobApplication.new()

@job_applications.job_seekers_id = Job_seeker.where(:users_id => @current_user.id).first.id
@job_applications.job_listings_id = params[:job_listing_id]



@job_applications.apply_date=Date.today.to_s
@job_applications.status="saved"
respond_to do |format|

if @job_applications.save

format.html{ render :html => @job_applications}

end
end
end
end
end