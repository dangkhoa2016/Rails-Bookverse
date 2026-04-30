require "application_system_test_case"

class GenresTest < ApplicationSystemTestCase
  setup do
    @genre = genres(:one)
  end

  test "visiting the index" do
    visit genres_url
    assert_selector "h2", text: "List of Genres"
  end

  test "should create genre" do
    visit genres_url
    click_on "New Genre"

    check "Active" if @genre.active
    fill_in "Name", with: "New #{@genre.name}"
    click_on "Create Genre"

    assert_text "was successfully created"
    click_on "Back to Genres"
  end

  test "should update Genre" do
    visit edit_genre_url(@genre)

    check "Active" if @genre.active
    fill_in "Name", with: @genre.name
    click_on "Update Genre"

    assert_text "was successfully updated"
    click_on "Back to Genres"
  end

  test "should destroy Genre" do
    visit genre_url(@genre)
    find("#genre_#{@genre.id} > .card-footer").click_on "Delete"
    click_on "Yes"

    assert_text "has been destroyed"
  end
end
