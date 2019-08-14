class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :app, foreign_key: true
    end
  end
end
