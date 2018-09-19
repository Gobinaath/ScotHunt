class JobListing < ApplicationRecord
has_many :job_applications, foreign_key: "job_listings_id"
#belongs_to :recruiter, foreign_key: "recruiters_id"
end
