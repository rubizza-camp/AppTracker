class AddIndexToAppId < ActiveRecord::Migration[5.2]
  def change
    add_index :apps, :android_app_id
  end
end
