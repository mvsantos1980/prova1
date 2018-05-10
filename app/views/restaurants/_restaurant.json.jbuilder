json.extract! restaurant, :id, :name, :phone, :address, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
