class RemoveIndustryFromRecruiters < ActiveRecord::Migration[5.1]
  def change
    remove_column :recruiters, :industry, :string
  end
end
