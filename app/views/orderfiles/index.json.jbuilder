json.array!(@orderfiles) do |orderfile|
  json.extract! orderfile, :id
  json.url orderfile_url(orderfile, format: :json)
end
