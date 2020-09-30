json.extract! ynab_account, :id, :name, :external_id, :account_type, :ynab_budget_id, :created_at, :updated_at
json.url ynab_account_url(ynab_account, format: :json)
