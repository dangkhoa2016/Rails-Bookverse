require "application_system_test_case"

class AuthorProfilesTest < ApplicationSystemTestCase
  setup do
    @author_profile = author_profiles(:one)
  end

  test "visiting the index" do
    visit author_profiles_url
    assert_selector "h1", text: "Author profiles"
  end

  test "should create author profile" do
    visit author_profiles_url
    click_on "New author profile"

    fill_in "Author", with: @author_profile.author_id
    fill_in "Bio", with: @author_profile.bio
    fill_in "Social links", with: @author_profile.social_links
    click_on "Create Author profile"

    assert_text "Author profile was successfully created"
    click_on "Back"
  end

  test "should update Author profile" do
    visit author_profile_url(@author_profile)
    click_on "Edit this author profile", match: :first

    fill_in "Author", with: @author_profile.author_id
    fill_in "Bio", with: @author_profile.bio
    fill_in "Social links", with: @author_profile.social_links
    click_on "Update Author profile"

    assert_text "Author profile was successfully updated"
    click_on "Back"
  end

  test "should destroy Author profile" do
    visit author_profile_url(@author_profile)
    click_on "Destroy this author profile", match: :first

    assert_text "Author profile was successfully destroyed"
  end
end
