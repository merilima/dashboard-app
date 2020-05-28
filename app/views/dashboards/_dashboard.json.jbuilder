json.extract! dashboard, :id, :title, :description, :position, :user_id, :created_at, :updated_at
json.url dashboard_url(dashboard, format: :json)
