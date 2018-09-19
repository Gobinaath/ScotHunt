class AddMobilenumberToRecruiters < ActiveRecord::Migration[5.1]
  def change
    add_column :recruiters, :mobilenumber, :string
  end
end
