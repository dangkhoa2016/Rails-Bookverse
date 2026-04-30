require "application_system_test_case"

class PublishersTest < ApplicationSystemTestCase
  setup do
    @publisher = publishers(:one)
  end

  test "visiting the index" do
    visit publishers_url
    assert_selector "h2", text: "List of Publishers"
  end

  test "should create publisher" do
    visit publishers_url
    click_on "New Publisher"

    check "Active" if @publisher.active
    fill_in "Name", with: "New #{@publisher.name}"
    fill_in "Email", with: @publisher.email
    click_on "Create Publisher"

    assert_text "was successfully created"
    click_on "Back to Publishers"
  end

  test "should update Publisher" do
    visit edit_publisher_url(@publisher)

    check "Active" if @publisher.active
    fill_in "Name", with: @publisher.name
    fill_in "Email", with: @publisher.email
    click_on "Update Publisher"

    assert_text "was successfully updated"
    click_on "Back to Publishers"
  end

  test "should destroy Publisher" do
    visit publisher_url(@publisher)
    find("#publisher_#{@publisher.id} > .card-footer").click_on "Delete"
    click_on "Yes"

    assert_text "has been destroyed"
  end
end
