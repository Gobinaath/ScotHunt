class RemoveYearAndMonthOfGraduationFromEducationDetail < ActiveRecord::Migration[5.1]
  def change
    remove_column :education_details, :year_and_month_of_graduation, :date
  end
end
