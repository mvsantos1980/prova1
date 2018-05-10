json.extract! dish, :id, :name, :price, :timePreparation, :created_at, :updated_at
json.url dish_url(dish, format: :json)
