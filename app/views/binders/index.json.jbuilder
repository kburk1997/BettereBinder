json.array!(@binders) do |binder|
  json.extract! binder, :id, :title, :description
  json.url binder_url(binder, format: :json)
end
