class AddIndexToIosIdFieldInApp < ActiveRecord::Migration[5.2]
  def change
    add_index :apps, :apple_app_id
  end
end
