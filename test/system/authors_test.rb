require "application_system_test_case"

class AuthorsTest < ApplicationSystemTestCase
  setup do
    @author = authors(:one)
  end

  test "visiting the index" do
    visit authors_url
    assert_selector "h2", text: "List of Authors"
  end

  test "should create author" do
    visit authors_url
    click_on "New"

    check "Active" if @author.active
    fill_in "author_email", with: @author.email
    fill_in "author_first_name", with: @author.first_name
    fill_in "author_last_name", with: @author.last_name
    click_on "Create Author"

    assert_text "Author [#{@author.full_name}] was successfully created."
    click_on "Back to Authors"
  end

  test "should update Author" do
    visit author_url(@author)
    find("#author_#{@author.id} > .card-footer").click_on "Edit"

    check "Active" if @author.active
    fill_in "author_email", with: @author.email
    fill_in "author_first_name", with: @author.first_name
    fill_in "author_last_name", with: @author.last_name
    click_on "Update Author"

    assert_text "Author [#{@author.full_name}] was successfully updated."
    click_on "Back to Authors"
  end

  test "should destroy Author" do
    visit author_url(@author)
    find("#author_#{@author.id} > .card-footer").click_on "Delete"
    click_on "Yes"

    assert_text "has been destroyed"
  end
end
