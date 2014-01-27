json.array!(@eventos) do |evento|
  json.extract! evento, 
  json.url evento_url(evento, format: :json)
end
