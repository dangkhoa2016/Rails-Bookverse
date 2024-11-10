require "application_system_test_case"

class PublishedDatesTest < ApplicationSystemTestCase
  setup do
    @published_date = published_dates(:one)
  end

  test "visiting the index" do
    visit published_dates_url
    assert_selector "h1", text: "Published dates"
  end

  test "should create published date" do
    visit published_dates_url
    click_on "New published date"

    fill_in "Book", with: @published_date.book_id
    fill_in "Edition", with: @published_date.edition
    fill_in "Published date", with: @published_date.published_date
    fill_in "Publisher", with: @published_date.publisher_id
    click_on "Create Published date"

    assert_text "Published date was successfully created"
    click_on "Back"
  end

  test "should update Published date" do
    visit published_date_url(@published_date)
    click_on "Edit this published date", match: :first

    fill_in "Book", with: @published_date.book_id
    fill_in "Edition", with: @published_date.edition
    fill_in "Published date", with: @published_date.published_date
    fill_in "Publisher", with: @published_date.publisher_id
    click_on "Update Published date"

    assert_text "Published date was successfully updated"
    click_on "Back"
  end

  test "should destroy Published date" do
    visit published_date_url(@published_date)
    click_on "Destroy this published date", match: :first

    assert_text "Published date was successfully destroyed"
  end
end
