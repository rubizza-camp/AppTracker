class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :company_name
      t.integer :review_count
      t.float :average_rating
      t.integer :downloads_count

      t.timestamps
    end
  end
end
