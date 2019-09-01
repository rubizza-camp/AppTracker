class ChangeAppsKeywords < ActiveRecord::Migration[5.2]
  def change
    remove_column :keywords, :shop_type
    remove_column :apps_keywords, :priority
  end
end
