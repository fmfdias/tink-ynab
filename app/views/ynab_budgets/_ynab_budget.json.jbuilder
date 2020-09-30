json.extract! ynab_budget, :id, :name, :external_id, :user_id, :created_at, :updated_at
json.url ynab_budget_url(ynab_budget, format: :json)
