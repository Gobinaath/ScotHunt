class JobListingController < ApplicationController
	before_action :login_required
  def job_listing

   
  conditions = ""
#:job_category => params[:job_category],:job_location => params[:job_location] , :job_type => params[:job_type]
if params[:job_category].present?
	conditions << " job_category = '#{params[:job_category]}' AND "
end
if params[:job_location].present?
	conditions << " job_location = '#{params[:job_location]}' AND "
end
if params[:job_type].present?
	conditions << " job_type = '#{params[:job_type]}' AND "
end



	if conditions.present?
		@jobsearch = JobListing.where("#{conditions[0..-6]}")

	else
	  	@jobsearch=JobListing.all
	end

  end

def search
#raise "#{params.to_json}"
conditions = ""
#:job_category => params[:job_category],:job_location => params[:job_location] , :job_type => params[:job_type]
if params[:job_category].present?
	conditions << " job_category = '#{params[:job_category]}' AND "
end
if params[:job_location].present?
	conditions << " job_location = '#{params[:job_location]}' AND "
end
if params[:job_type].present?
	conditions << " job_type = '#{params[:job_type]}' AND "
end


@jobsearch = JobListing.where("#{conditions[0..-6]}")
render :partial=>'job_listing'
end


def filter
    conditions = ""
if params[:job_type].present?
    conditions << " job_type = '#{params[:job_type]}' AND "
end
@jobsearch = JobListing.where("#{conditions[0..-6]}")
render :partial=>'job_listing'
end

end
