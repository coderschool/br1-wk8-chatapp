json.extract! announcement, :id, :body, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
