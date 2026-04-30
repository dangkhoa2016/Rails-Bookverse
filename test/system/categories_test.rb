require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @category = categories(:one)
  end

  test "visiting the index" do
    visit categories_url
    assert_selector "h2", text: "List of Categories"
  end

  test "should create category" do
    visit categories_url
    click_on "New Category"

    check "Active" if @category.active
    fill_in "Name", with: "New #{@category.name}"
    click_on "Create Category"

    assert_text "was successfully created"
    click_on "Back to Categories"
  end

  test "should update Category" do
    visit edit_category_url(@category)

    check "Active" if @category.active
    fill_in "Name", with: @category.name
    click_on "Update Category"

    assert_text "was successfully updated"
    click_on "Back to Categories"
  end

  test "should destroy Category" do
    visit category_url(@category)
    find("#category_#{@category.id} > .card-footer").click_on "Delete"
    click_on "Yes"

    assert_text "has been destroyed"
  end
end
