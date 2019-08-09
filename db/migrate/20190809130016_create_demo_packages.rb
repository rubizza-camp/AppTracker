class CreateDemoPackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :name
      t.float :average_rating
      t.string :google_play_link
      t.string :icon_link
    end
  end
end
