json.extract! history_sale, :id, :period, :date, :quantity, :created_at, :updated_at
json.url history_sale_url(history_sale, format: :json)