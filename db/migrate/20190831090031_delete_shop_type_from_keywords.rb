class DeleteShopTypeFromKeywords < ActiveRecord::Migration[5.2]
  def change
    remove_column :keywords, :shop_type
  end
end
