class AddPrefferedJobTypeToJobSeeker < ActiveRecord::Migration[5.1]
  def change
    add_column :job_seekers, :preffered_job_type, :string
  end
end
