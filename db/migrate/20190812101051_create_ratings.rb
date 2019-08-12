class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.timestamp
      t.integer :rating_1
      t.integer :rating_2
      t.integer :rating_3
      t.integer :rating_4
      t.integer :rating_5
      t.integer :total_rating
      t.integer :average_rating
      t.string :shop_type
      t.date :date
      t.belongs_to :application, foreign_key: true
    end
  end
end
