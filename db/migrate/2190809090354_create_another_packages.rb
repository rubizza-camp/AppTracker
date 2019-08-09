class CreateAnotherPackages < ActiveRecord::Migration[5.2]
  def change
    drop_table :another_packages
    create_table :packages do |t|
      t.string :name
      t.string :company_name
      t.integer :review_count
      t.float :average_rating
      t.integer :downloads_count
      t.string :icon_link
      t.timestamps
    end
  end
end
