require "test_helper"

class PublishersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publishers_url
    assert_response :success
  end

  test "should get show" do
    get publisher_url(publishers(:one))
    assert_response :success
  end
end
