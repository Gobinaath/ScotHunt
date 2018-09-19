class AddOrganisationNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :organisation_name, :string
  end
end
