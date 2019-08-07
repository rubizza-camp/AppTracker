class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :login
      t.string :name
      t.string :password
      t.string :role
      t.string :image
    end
  end
end
