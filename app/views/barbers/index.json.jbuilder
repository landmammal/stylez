json.array!(@barbers) do |barber|
  json.extract! barber, :id, :name, :avatar, :instagram, :shop_id
  json.url barber_url(barber, format: :json)
end
