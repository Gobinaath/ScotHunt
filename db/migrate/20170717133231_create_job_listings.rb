class CreateJobListings < ActiveRecord::Migration[5.1]
  def change
    create_table :job_listings do |t|
    	t.references :recruiters
    	t.string :job_title
    	t.string :job_type
    	t.string :job_location
    	t.string :job_category
    	t.string :job_period
    	t.string :job_description
    	t.decimal :compensation
    	t.string :company_name
    	t.string :website
    	t.string :company_description
    	t.string :linkedin_link

      t.timestamps
    end
  end
end
