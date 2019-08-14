class CreateTargetCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :target_countries do |t|
      t.string :country_name

      t.timestamps
    end
  end
end
