json.extract! trip, :id, :name, :price, :description, :created_at, :updated_at
json.url trip_url(trip, format: :json)
