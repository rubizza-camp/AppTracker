class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.string :keywords
      t.integer :rank
      t.string :shop_type
      t.integer :app_id
    end
  end
end
