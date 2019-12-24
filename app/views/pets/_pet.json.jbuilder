json.extract! pet, :id, :name, :user_id, :breed, :species, :created_at, :updated_at
json.url pet_url(pet, format: :json)
