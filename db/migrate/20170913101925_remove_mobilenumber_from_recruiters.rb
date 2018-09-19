class RemoveMobilenumberFromRecruiters < ActiveRecord::Migration[5.1]
  def change
    remove_column :recruiters, :mobilenumber, :integer
  end
end
