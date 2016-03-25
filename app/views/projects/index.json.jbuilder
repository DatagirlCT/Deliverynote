json.array!(@projects) do |project|
  json.extract! project, :id, :name, :code, :user_id
  json.url project_url(project, format: :json)
end
