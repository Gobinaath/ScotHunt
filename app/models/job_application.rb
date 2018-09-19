class JobApplication < ApplicationRecord
belongs_to :job_seeker, class_name: "Job_seeker", foreign_key: "job_seekers_id"
belongs_to :job_listing, foreign_key: "job_listings_id"
end
