class AddJobSeekersToAssignments < ActiveRecord::Migration[5.1]
  def change
    add_reference :assignments, :job_seekers, foreign_key: true
  end
end
