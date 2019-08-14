class CreateAppsKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :apps_keywords do |t|
      t.integer :priotity
      t.belongs_to :app, foreign_key: true
      t.belongs_to :keyword, foreign_key: true
    end
  end
end
