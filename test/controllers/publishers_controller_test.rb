require "test_helper"

class PublishersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @publisher = publishers(:one)
  end

  test "should get index" do
    get publishers_url
    assert_response :success
  end

  test "should get new" do
    get new_publisher_url
    assert_response :success
  end

  test "should create publisher" do
    assert_difference("Publisher.count") do
      post publishers_url, params: { publisher: {
        active: @publisher.active,
        address: @publisher.address,
        ceo_name: @publisher.ceo_name,
        email: @publisher.email,
        established_year: @publisher.established_year,
        name: @publisher.name + " - New",
        phone_number: @publisher.phone_number,
        website: @publisher.website
      } }
    end

    assert_redirected_to publisher_url(Publisher.last)
  end

  test "should show publisher" do
    get publisher_url(@publisher)
    assert_response :success
  end

  test "should get edit" do
    get edit_publisher_url(@publisher)
    assert_response :success
  end

  test "should update publisher" do
    patch publisher_url(@publisher), params: { publisher: {
      active: @publisher.active,
      address: @publisher.address,
      ceo_name: @publisher.ceo_name,
      email: @publisher.email,
      established_year: @publisher.established_year,
      name: @publisher.name + " - Updated",
      phone_number: @publisher.phone_number,
      website: @publisher.website
    } }
    assert_redirected_to publisher_url(@publisher)
  end

  test "should destroy publisher" do
    assert_difference("Publisher.count", -1) do
      delete publisher_url(@publisher)
    end

    assert_redirected_to publishers_url
  end
end
