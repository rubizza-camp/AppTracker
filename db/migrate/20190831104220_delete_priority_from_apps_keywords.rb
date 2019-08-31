class DeletePriorityFromAppsKeywords < ActiveRecord::Migration[5.2]
  def change
    remove_column :apps_keywords, :priority
  end
end
