class RemoveFirstNameFromJobSeekers < ActiveRecord::Migration[5.1]
  def change
    remove_column :job_seekers, :first_name, :string
    remove_column :job_seekers, :last_name, :string
  end
end
