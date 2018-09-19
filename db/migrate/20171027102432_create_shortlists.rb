class CreateShortlists < ActiveRecord::Migration[5.1]
  def change
    create_table :shortlists do |t|
    	t.references :job_seekers
    	t.references :recruiters

      t.timestamps
    end
  end
end
