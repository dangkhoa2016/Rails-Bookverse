require "test_helper"

class AuthorProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author_profile = author_profiles(:one)
  end

  test "should get index" do
    get author_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_author_profile_url
    assert_response :success
  end

  test "should create author_profile" do
    assert_difference("AuthorProfile.count") do
      post author_profiles_url, params: { author_profile: { active: @author_profile.active, author_id: @author_profile.author_id, bio: @author_profile.bio, social_facebook: @author_profile.social_facebook, social_instagram: @author_profile.social_instagram, social_linkedin: @author_profile.social_linkedin, social_twitter: @author_profile.social_twitter, social_youtube: @author_profile.social_youtube } }
    end

    assert_redirected_to author_profile_url(AuthorProfile.last)
  end

  test "should show author_profile" do
    get author_profile_url(@author_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_author_profile_url(@author_profile)
    assert_response :success
  end

  test "should update author_profile" do
    patch author_profile_url(@author_profile), params: { author_profile: { active: @author_profile.active, author_id: @author_profile.author_id, bio: @author_profile.bio, social_facebook: @author_profile.social_facebook, social_instagram: @author_profile.social_instagram, social_linkedin: @author_profile.social_linkedin, social_twitter: @author_profile.social_twitter, social_youtube: @author_profile.social_youtube } }
    assert_redirected_to author_profile_url(@author_profile)
  end

  test "should destroy author_profile" do
    assert_difference("AuthorProfile.count", -1) do
      delete author_profile_url(@author_profile)
    end

    assert_redirected_to author_profiles_url
  end
end
