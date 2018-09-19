class AddNameToRecruiters < ActiveRecord::Migration[5.1]
  def change
    add_column :recruiters, :name, :string
    add_column :recruiters, :email, :string
    add_column :recruiters, :mobilenumber, :integer
  end
end
