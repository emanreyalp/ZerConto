json.extract! location, :id, :address, :city, :zip_code, :country_id, :created_at, :updated_at
json.url location_url(location, format: :json)
