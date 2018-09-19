class RemoveUnderGraduationFromEducationDetails < ActiveRecord::Migration[5.1]
  def change
    remove_column :education_details, :under_graduation, :string
    remove_column :education_details, :post_graduation, :string
    remove_column :education_details, :education_level_certificates, :string
  end
end
