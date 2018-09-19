class CreateAvailableDates < ActiveRecord::Migration[5.1]
  def change
    create_table :available_dates do |t|
      t.string :internfrom
      t.string :internto
      t.string :projectfrom
      t.string :projectto
      t.string :fulltimefrom

      t.timestamps
    end
  end
end
