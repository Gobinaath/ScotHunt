class CreateUploads < ActiveRecord::Migration[5.1]
  def change
    create_table :uploads do |t|
    	t.references :job_seekers
    	t.string :cover_letter
    	t.string :resume
    	t.string :video_pitch
    	t.string :sample_project
    	t.string :project_description
    	t.string :career_aspirations

      t.timestamps
    end
  end
end
