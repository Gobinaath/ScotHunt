class AddAddressToJobSeeker < ActiveRecord::Migration[5.1]
  def change
    add_column :job_seekers, :address, :string
    add_column :job_seekers, :phone_number, :string
  end
end
