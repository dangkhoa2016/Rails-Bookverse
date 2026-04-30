require "application_system_test_case"

class LibrariesTest < ApplicationSystemTestCase
  setup do
    @library = libraries(:one)
  end

  test "visiting the index" do
    visit libraries_url
    assert_selector "h2", text: "List of Libraries"
  end

  test "should create library" do
    visit libraries_url
    click_on "New Library"

    check "Active" if @library.active
    fill_in "Name", with: "Test Library"
    click_on "Create Library"

    assert_text "was successfully created"
    click_on "Back to Libraries"
  end

  test "should update Library" do
    visit edit_library_url(@library)

    check "Active" if @library.active
    fill_in "Name", with: @library.name
    click_on "Update Library"

    assert_text "was successfully updated"
    click_on "Back to Libraries"
  end

  test "should destroy Library" do
    visit library_url(@library)
    find("#library_#{@library.id} > .card-footer").click_on "Delete"
    click_on "Yes"

    assert_text "has been destroyed"
  end
end
