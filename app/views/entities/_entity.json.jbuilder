json.extract! entity, :id, :user, :email, :password, :identifier, :name, :address, :has_one, :phone, :created_at, :updated_at
json.url entity_url(entity, format: :json)
