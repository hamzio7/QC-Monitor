json.extract! user, :id, :username, :password, :shift, :isAdmin, :created_at, :updated_at
json.url user_url(user, format: :json)
