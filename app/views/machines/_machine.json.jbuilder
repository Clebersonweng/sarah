json.extract! machine, :id, :brand_id, :model_id, :hp, :consumption, :price, :year_purchase, :created_at, :updated_at
json.url machine_url(machine, format: :json)