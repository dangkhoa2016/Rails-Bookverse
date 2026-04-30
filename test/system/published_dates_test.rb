require "application_system_test_case"

class PublishedDatesTest < ApplicationSystemTestCase
  setup do
    @published_date = published_dates(:one)
  end

  test "visiting the index" do
    visit published_dates_url
    assert_selector "h2", text: "List of Published Dates"
  end

  test "should create published date" do
    visit published_dates_url
    click_on "New Published Date"
    assert_selector "h2", text: "New Published Date"

    page.execute_script(<<~JS)
      var bookSel = document.querySelector("select[name='published_date[book_id]']");
      bookSel.removeAttribute('disabled');
      bookSel.add(new Option("", "#{@published_date.book_id}", true, true));
      var pubSel = document.querySelector("select[name='published_date[publisher_id]']");
      pubSel.removeAttribute('disabled');
      pubSel.add(new Option("", "#{@published_date.publisher_id}", true, true));
    JS
    page.execute_script("document.querySelector(\"input[name='published_date[published_date]']\").value = '#{@published_date.published_date}'")
    fill_in "Edition", with: @published_date.edition
    click_on "Create Published Date"

    assert_text "was successfully created"
    click_on "Back to Published Dates"
  end

  test "should update Published date" do
    visit edit_published_date_url(@published_date)

    fill_in "Edition", with: @published_date.edition
    click_on "Update Published Date"

    assert_text "was successfully updated"
    click_on "Back to Published Dates"
  end

  test "should destroy Published date" do
    visit published_date_url(@published_date)
    find("#published_date_#{@published_date.id} > .card-footer").click_on "Delete"
    click_on "Yes"

    assert_text "has been destroyed"
  end
end
