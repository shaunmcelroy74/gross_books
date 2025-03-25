require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page = pages(:one)
  end

  test "should get index" do
    get pages_url
    assert_response :success
  end

  test "should get new" do
    get new_page_url
    assert_response :success
  end

  test "should create page" do
    assert_difference("Page.count") do
      post pages_url, params: { page: {
        title: "New Unique Title",
        content: "New unique content",
        permalink: "unique-permalink-123"
      } }
    end

    page = assigns(:page)
    page.reload
    assert_redirected_to page_url(page)
  end

  test "should show page" do
    get page_url(@page.to_param)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_url(@page)
    assert_response :success
  end

  test "should update page" do
    patch page_url(@page), params: { page: {
      title: "Updated Unique Title",
      content: "Updated unique content",
      permalink: "updated-unique-permalink-456"
    } }
    page = assigns(:page)
    page.reload
    assert_redirected_to page_url(page)
  end

  test "should destroy page" do
    assert_difference("Page.count", -1) do
      delete page_url(@page)
    end

    assert_redirected_to pages_url
  end
end
