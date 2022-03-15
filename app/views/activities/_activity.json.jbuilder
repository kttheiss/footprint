json.extract! activity, :id, :date, :name, :category_id, :user_id,
              :description, :footprint_level_id, :created_at, :updated_at
json.url activity_url(activity, format: :json)
