json.extract! person, :id, :name, :lastname, :salary, :user_id, :ruc_ci, :address, :phone, :birthday, :gender, :created_at, :updated_at
json.url person_url(person, format: :json)