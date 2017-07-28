class AddDefaultPriceToTrips < ActiveRecord::Migration[5.0]
  def change
    change_column :trips, :price, :integer, default: 0
  end
end
