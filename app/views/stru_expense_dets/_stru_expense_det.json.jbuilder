json.extract! stru_expense_det, :id, :structure_expense_id, :name, :amount, :subtotal, :created_at, :updated_at
json.url stru_expense_det_url(stru_expense_det, format: :json)