class Job_seeker < ApplicationRecord
has_many :job_applications, foreign_key: "job_seekers_id"
belongs_to :user, foreign_key: "users_id"
end
