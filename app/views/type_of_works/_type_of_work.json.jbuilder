json.extract! type_of_work, :id, :name, :price_hours, :description, :created_at, :updated_at
json.url type_of_work_url(type_of_work, format: :json)