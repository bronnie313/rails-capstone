json.extract! icome_transaction, :id, :name, :amount, :user_id, :created_at, :updated_at
json.url icome_transaction_url(icome_transaction, format: :json)
