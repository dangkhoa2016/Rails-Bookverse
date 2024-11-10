json.extract! author_profile, :id, :author_id, :bio, :social_facebook, :social_twitter, :social_instagram, :social_linkedin, :social_youtube, :active, :created_at, :updated_at
json.url author_profile_url(author_profile, format: :json)
