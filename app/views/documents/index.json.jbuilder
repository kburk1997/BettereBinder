json.array!(@documents) do |document|
  json.extract! document, :id, :title, :description, :document_url, :tab_id
  json.url document_url(document, format: :json)
end
