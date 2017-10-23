json.extract! factura, :id, :id, :name_client, :fecha, :descripcion, :total, :created_at, :updated_at
json.url factura_url(factura, format: :json)
