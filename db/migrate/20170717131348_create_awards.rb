class CreateAwards < ActiveRecord::Migration[5.1]
  def change
    create_table :awards do |t|
    	t.references :job_seekers
    	t.string :award_name
    	t.string :award_description
    	t.date :year_of_the_award

      t.timestamps
    end
  end
end
