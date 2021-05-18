json.extract! contact, :id, :name, :last_name, :phone_number, :communication_channel, :user_id, :email, :organization, :facebook, :instagram, :twitter, :created_at, :updated_at
json.url contact_url(contact, format: :json)
