class AddPhoneNumberToJobListing < ActiveRecord::Migration[5.1]
  def change
    add_column :job_listings, :phone_number, :decimal
    add_column :job_listings, :email, :string
  end
end
