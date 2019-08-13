class CreateTargetApps < ActiveRecord::Migration[5.2]
  def change
    create_table :target_apps do |t|
      t.string :application_name

      t.timestamps
    end
  end
end
