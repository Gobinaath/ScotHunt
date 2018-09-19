class CreateSkillsets < ActiveRecord::Migration[5.1]
  def change
    create_table :skillsets do |t|
    	t.references :job_seekers
    	t.string :sill_name
    	t.string :skill_level
    	

      t.timestamps
    end
  end
end
