json.extract! author_profile, :id, :author_id, :bio, :social_links, :created_at, :updated_at
json.url author_profile_url(author_profile, format: :json)
