class FixConfirmTokenFromUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :confirm_token, :confirmation_token
  end
end
