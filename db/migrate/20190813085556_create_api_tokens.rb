class CreateApiTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :api_tokens do |t|
      t.string :token
      t.integer :credits, :default => 100
    end
  end
end
