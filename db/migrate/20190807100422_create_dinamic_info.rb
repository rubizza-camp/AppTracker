class CreateDinamicInfo < ActiveRecord::Migration[5.2]
  def change
    create_table :dinamic_infos do |t|
      t.timestamp
      t.string :country
      t.date :date
      t.integer :rank
      t.float :power
      t.integer :downloads
      t.string :shop_type
      t.string :device
      t.integer :app_id
    end
  end
end
