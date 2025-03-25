require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page = pages(:one)
    @auth_headers = {
      "HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Basic.encode_credentials("admin", "secret")
    }
  end

  test "should get index" do
    get pages_url, headers: @auth_headers
    assert_response :success
  end

  test "should get new" do
    get new_page_url, headers: @auth_headers
    assert_response :success
  end

  test "should create page" do
    assert_difference("Page.count") do
      post pages_url, params: { page: {
        title: "New Unique Title",
        content: "New unique content",
        permalink: "unique-permalink-123"
      } }, headers: @auth_headers
    end

    # Use the custom route helper
    assert_redirected_to pages_permalink_url(Page.last)
  end

  test "should show page" do
    get pages_permalink_url(@page), headers: @auth_headers
    assert_response :success
  end

  test "should get edit" do
    get edit_page_url(@page), headers: @auth_headers
    assert_response :success
  end

  test "should update page" do
    patch page_url(@page), params: { page: {
      title: "Updated Unique Title",
      content: "Updated unique content",
      permalink: "updated-unique-permalink-456"
    } }, headers: @auth_headers
    @page.reload
    # Use the custom route helper
    assert_redirected_to pages_permalink_url(@page)
  end


  test "should destroy page" do
    assert_difference("Page.count", -1) do
      delete page_url(@page), headers: @auth_headers
    end

    assert_redirected_to pages_url
  end
end
