require "application_system_test_case"

class TagsTest < ApplicationSystemTestCase
  setup do
    @tag = tags(:one)
  end

  test "visiting the index" do
    visit tags_url
    assert_selector "h2", text: "List of Tags"
  end

  test "should create tag" do
    visit tags_url
    click_on "New Tag"

    check "Active" if @tag.active
    fill_in "Name", with: "New #{@tag.name}"
    click_on "Create Tag"

    assert_text "was successfully created"
    click_on "Back to Tags"
  end

  test "should update Tag" do
    visit edit_tag_url(@tag)

    check "Active" if @tag.active
    fill_in "Name", with: @tag.name
    click_on "Update Tag"

    assert_text "was successfully updated"
    click_on "Back to Tags"
  end

  test "should destroy Tag" do
    visit tag_url(@tag)
    find("#tag_#{@tag.id} > .card-footer").click_on "Delete"
    click_on "Yes"

    assert_text "has been destroyed"
  end
end
