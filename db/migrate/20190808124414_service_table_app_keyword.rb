class ServiceTableAppKeyword < ActiveRecord::Migration[5.2]
  def change
    create_table :service_table_app_keywords do |t|
      t.integer :app_id
      t.integer :keyword_id
    end
  end
end
