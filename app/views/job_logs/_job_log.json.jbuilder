json.extract! job_log, :id, :state_code, :message, :created_at, :updated_at
json.url job_log_url(job_log, format: :json)
