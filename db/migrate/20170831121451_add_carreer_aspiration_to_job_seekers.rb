class AddCarreerAspirationToJobSeekers < ActiveRecord::Migration[5.1]
  def change
    add_column :job_seekers, :carreer_aspiration, :string
  end
end
