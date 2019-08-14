class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :api_tokens, :token, :value
  end
end
