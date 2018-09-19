class RemoveAgeFromJobSeekers < ActiveRecord::Migration[5.1]
  def change
    remove_column :job_seekers, :age, :integer
    remove_column :job_seekers, :language_known, :string
    remove_column :job_seekers, :job_period_from, :date
    remove_column :job_seekers, :job_period_to, :date
  end
end
