require "test_helper"

class PublishedDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @published_date = published_dates(:one)
  end

  test "should get index" do
    get published_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_published_date_url
    assert_response :success
  end

  test "should create published_date" do
    assert_difference("PublishedDate.count") do
      post published_dates_url, params: { published_date: { book_id: @published_date.book_id, edition: @published_date.edition, published_date: @published_date.published_date, publisher_id: @published_date.publisher_id } }
    end

    assert_redirected_to published_date_url(PublishedDate.last)
  end

  test "should show published_date" do
    get published_date_url(@published_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_published_date_url(@published_date)
    assert_response :success
  end

  test "should update published_date" do
    patch published_date_url(@published_date), params: { published_date: { book_id: @published_date.book_id, edition: @published_date.edition, published_date: @published_date.published_date, publisher_id: @published_date.publisher_id } }
    assert_redirected_to published_date_url(@published_date)
  end

  test "should destroy published_date" do
    assert_difference("PublishedDate.count", -1) do
      delete published_date_url(@published_date)
    end

    assert_redirected_to published_dates_url
  end
end
