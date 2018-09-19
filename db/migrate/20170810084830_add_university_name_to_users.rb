class AddUniversityNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :university_name, :string
  end
end
