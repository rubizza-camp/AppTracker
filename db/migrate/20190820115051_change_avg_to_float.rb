class ChangeAvgToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :ratings, :average_rating, :float
  end
end
