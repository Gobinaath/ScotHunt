class CreateJobSeekers < ActiveRecord::Migration[5.1]
  def change
    create_table :job_seekers do |t|
    	t.references :users
    	t.string :first_name
    	t.string :last_name
    	t.integer :age
    	t.string :preffered_role
    	t.string :prefferd_industry
    	t.string :preffered_location
    	t.string :preffered_organisation
    	t.date :job_period_from
    	t.date :job_period_to
    	t.decimal :current_salary
    	t.decimal :expected_salary
    	t.string :language_known
    	t.string :linkedin_link
    	t.string :skype_id

      t.timestamps
    end
  end
end
