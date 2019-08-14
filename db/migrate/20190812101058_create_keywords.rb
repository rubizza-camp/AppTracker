class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.string :value
      t.string :shop_type
    end
  end
end
