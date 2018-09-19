class AddFromdateToEducationDetail < ActiveRecord::Migration[5.1]
  def change
    add_column :education_details, :fromdate, :date
    add_column :education_details, :todate, :date
  end
end
