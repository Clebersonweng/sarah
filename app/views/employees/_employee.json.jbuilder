json.extract! employee, :id, :name, :lastname, :salary, :user_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)