class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :images_link
      t.string :videos_link
      t.string :assignment_description

      t.timestamps
    end
  end
end
