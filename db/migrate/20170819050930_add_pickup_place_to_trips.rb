class AddPickupPlaceToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :Pickup_place, :string
  end
end
