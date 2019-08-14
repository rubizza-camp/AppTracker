class CreateDynamicInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :dynamic_infos do |t|
      t.timestamp
      t.string :country
      t.date :date
      t.integer :rank
      t.float :power
      t.integer :downloads
      t.string :shop_type
      t.string :device
      t.belongs_to :app, foreign_key: true
    end
  end
end
