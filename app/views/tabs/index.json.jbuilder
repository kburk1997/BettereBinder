json.array!(@tabs) do |tab|
  json.extract! tab, :id, :title, :description
  json.url tab_url(tab, format: :json)
end
