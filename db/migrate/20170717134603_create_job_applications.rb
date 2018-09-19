class CreateJobApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :job_applications do |t|
    	t.references :job_seekers
    	t.references :job_listings
    	t.date :apply_date
    	t.string :status

      t.timestamps
    end
  end
end
