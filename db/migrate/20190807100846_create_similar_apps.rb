class CreateSimilarApps < ActiveRecord::Migration[5.2]
  def change
    create_table :similar_apps do |t|
      t.integer :apple_app_id
      t.string :android_app_id
      t.integer :app_id
    end
  end
end
