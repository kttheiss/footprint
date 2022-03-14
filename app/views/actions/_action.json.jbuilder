json.extract! action, :id, :date, :name, :category_id, :user_id, :description,
              :footprint_level_id, :created_at, :updated_at
json.url action_url(action, format: :json)
