json.array!(@user_groups) do |user_group|
  json.extract! user_group, :id, :name, :description, :homepage
  json.url user_group_url(user_group, format: :json)
end
