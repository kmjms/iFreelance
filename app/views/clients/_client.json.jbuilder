json.extract! client, :id, :user, :name, :email, :password, :totalPayments, :lastAccess, :created_at, :updated_at
json.url client_url(client, format: :json)
