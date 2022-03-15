json.extract! activity_log, :id, :name, :date, :category_id, :user_id,
              :description, :footprint, :footprint_number, :created_at, :updated_at
json.url activity_log_url(activity_log, format: :json)
