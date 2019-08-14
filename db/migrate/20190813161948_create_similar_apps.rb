class CreateSimilarApps < ActiveRecord::Migration[5.2]
  def change
    create_table :similar_apps do |t|
      t.integer :similar_app_id
      t.belongs_to :app, foreign_key: true
    end
  end
end
