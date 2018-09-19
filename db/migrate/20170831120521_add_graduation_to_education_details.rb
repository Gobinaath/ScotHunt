class AddGraduationToEducationDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :education_details, :graduation, :string
    add_column :education_details, :place, :string
    add_column :education_details, :grade, :string
  end
end
