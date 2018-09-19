class AddJobSeekersToAvailableDates < ActiveRecord::Migration[5.1]
  def change
    add_reference :available_dates, :job_seekers, foreign_key: true
  end
end
