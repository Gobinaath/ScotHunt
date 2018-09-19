class CreateExperianceDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :experiance_details do |t|
    	t.references :job_seekers
    	t.string :organisation_name
    	t.string :place
    	t.date :start_date
    	t.date :end_date
    	t.string :designation
    	t.string :work_description 

      t.timestamps
    end
  end
end
