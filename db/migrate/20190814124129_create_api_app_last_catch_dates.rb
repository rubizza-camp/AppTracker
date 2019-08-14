class CreateApiAppLastCatchDates < ActiveRecord::Migration[5.2]
  def change
    create_table :api_app_last_catch_dates do |t|
      t.datetime :date
      t.integer :app_id

      t.timestamps
    end
  end
end
