json.extract! structure_expense, :id, :program_production_id, :chart_of_account_id, :total, :created_at, :updated_at
json.url structure_expense_url(structure_expense, format: :json)