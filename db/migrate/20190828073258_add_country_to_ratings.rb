class AddCountryToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :country, :string
  end
end
