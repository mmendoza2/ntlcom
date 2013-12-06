json.array!(@actividadespadre) do |actividad|
  json.extract! actividad, 
  json.url actividad_url(actividad, format: :json)
end