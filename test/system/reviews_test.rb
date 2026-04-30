require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  setup do
    @review = reviews(:one)
  end

  test "visiting the index" do
    visit reviews_url
    assert_selector "h2", text: "List of Reviews"
  end

  test "should create review" do
    visit reviews_url
    click_on "New Review"
    assert_selector "h2", text: "New Review"

    page.execute_script(<<~JS)
      var sel = document.querySelector("select[name='review[book_id]']");
      sel.removeAttribute('disabled');
      sel.add(new Option("", "#{@review.book_id}", true, true));
    JS
    check "Active" if @review.active
    fill_in "review_rating", with: @review.rating
    fill_in "review_content", with: @review.content
    click_on "Create Review"

    assert_text "was successfully created"
    click_on "Back to Reviews"
  end

  test "should update Review" do
    visit edit_review_url(@review)

    check "Active" if @review.active
    fill_in "review_rating", with: @review.rating
    fill_in "review_content", with: @review.content
    click_on "Update Review"

    assert_text "was successfully updated"
    click_on "Back to Reviews"
  end

  test "should destroy Review" do
    visit review_url(@review)
    find("#review_#{@review.id} > .card-footer").click_on "Delete"
    click_on "Yes"

    assert_text "has been destroyed"
  end
end
