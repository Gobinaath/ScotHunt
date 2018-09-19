class CreateRecruiters < ActiveRecord::Migration[5.1]
  def change
    create_table :recruiters do |t|
    	t.references :users
    	t.string :organisation_name
    	t.string :designation
    	t.string :industry
    	t.string :linkedin_link
    	t.string :photo

      t.timestamps
    end
  end
end
