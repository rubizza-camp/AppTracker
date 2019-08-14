class CreateApps < ActiveRecord::Migration[5.2]
  def change
    create_table :apps do |t|
      t.integer :apple_app_id
      t.string :android_app_id
      t.string :title
      t.string :apple_url
      t.string :andriod_url
      t.string :short_description
      t.string :long_description
      t.string :icon_url
      t.string :content_rating
      t.string :price
      t.string :dev_name
      t.string :dev_email
      t.string :dev_website
    end
  end
end
