class AddDobToJobSeekers < ActiveRecord::Migration[5.1]
  def change
    add_column :job_seekers, :dob, :string
    add_column :job_seekers, :profile_title, :string
    add_column :job_seekers, :profile_description, :string
  end
end
