class Recruiter < ApplicationRecord
has_many :job_listings, foreign_key: "recruiters_id"
#  validates :name, :designation, :organisation, presence: true 
 # validates :mobile_num, :linkedin_link, presence: true ,uniqueness: true
   # validates :password , confirmation: true
  #  validates :email,
   #          presence: true,
    #         format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, 
     #        uniqueness: true
 

end
