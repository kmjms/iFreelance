json.extract! job, :id, :billNumber, :name, :price, :duration, :state, :created_at, :updated_at
json.url job_url(job, format: :json)
