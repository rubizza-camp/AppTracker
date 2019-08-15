class ChangeColumnsName < ActiveRecord::Migration[5.2]
  def change
    rename_column :apps, :andriod_url, :android_url
    rename_column :apps_keywords, :priotity, :priority
  end
end
