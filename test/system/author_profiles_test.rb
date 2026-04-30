require "application_system_test_case"

class AuthorProfilesTest < ApplicationSystemTestCase
  setup do
    @author_profile = author_profiles(:one)
  end

  test "visiting the index" do
    visit author_profiles_url
    assert_selector "h2", text: "List of Author Profiles"
  end

  test "should create author profile" do
    visit author_profiles_url
    click_on "New Author Profile"
    assert_selector "h2", text: "New Author Profile"

    page.execute_script(<<~JS)
      var sel = document.querySelector("select[name='author_profile[author_id]']");
      sel.removeAttribute('disabled');
      sel.add(new Option("", "#{@author_profile.author_id}", true, true));
    JS
    check "Active" if @author_profile.active
    fill_in "Bio", with: @author_profile.bio
    find("input[name='author_profile[social_facebook]']").set(@author_profile.social_facebook)
    find("input[name='author_profile[social_twitter]']").set(@author_profile.social_twitter)
    find("input[name='author_profile[social_instagram]']").set(@author_profile.social_instagram)
    find("input[name='author_profile[social_linkedin]']").set(@author_profile.social_linkedin)
    find("input[name='author_profile[social_youtube]']").set(@author_profile.social_youtube)
    click_on "Create Author Profile"

    assert_text "was successfully created"
    click_on "Back to Author Profiles"
  end

  test "should update Author profile" do
    visit edit_author_profile_url(@author_profile)

    check "Active" if @author_profile.active
    fill_in "Bio", with: @author_profile.bio
    find("input[name='author_profile[social_facebook]']").set(@author_profile.social_facebook)
    find("input[name='author_profile[social_twitter]']").set(@author_profile.social_twitter)
    find("input[name='author_profile[social_instagram]']").set(@author_profile.social_instagram)
    find("input[name='author_profile[social_linkedin]']").set(@author_profile.social_linkedin)
    find("input[name='author_profile[social_youtube]']").set(@author_profile.social_youtube)
    click_on "Update Author Profile"

    assert_text "was successfully updated"
    click_on "Back to Author Profiles"
  end

  test "should destroy Author profile" do
    visit author_profile_url(@author_profile)
    find("#author_profile_#{@author_profile.id} > .card-footer").click_on "Delete"
    click_on "Yes"

    assert_text "has been destroyed"
  end
end
