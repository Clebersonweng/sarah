json.extract! supply_detail, :id, :supply, :product_id, :quantity_needed, :float, :subtotal, :created_at, :updated_at
json.url supply_detail_url(supply_detail, format: :json)