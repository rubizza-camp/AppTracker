class ChangeAppRatingToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :apps, :rating, :float
  end
end
