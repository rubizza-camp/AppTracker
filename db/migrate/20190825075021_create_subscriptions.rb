class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :subscriber, foreign_key: true
      t.belongs_to :app, foreign_key: true

      t.timestamps
    end
  end
end
