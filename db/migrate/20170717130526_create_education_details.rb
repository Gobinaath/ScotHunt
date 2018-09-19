class CreateEducationDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :education_details do |t|
    	t.references :job_seekers
    	t.string :university
    	t.string :under_graduation
    	t.string :post_graduation
    	t.string :course_name
    	t.string :education_level_certificates
    	t.date :year_and_month_of_graduation

      t.timestamps
    end
  end
end
