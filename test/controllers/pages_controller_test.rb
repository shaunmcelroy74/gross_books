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

    assert_redirected_to pages_permalink_path(Page.last.permalink)
  end

  test "should show page" do
    get pages_permalink_path(@page.permalink)
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
      # Even if a new permalink is submitted, if you want to keep it immutable,
      # your controller will ignore it. For now, assume your fixture’s permalink remains.
      permalink: @page.permalink
    } }
    @page.reload
    # Check that the flash message is present:
    assert_match "Page was successfully updated", @response.body
    # And that the redirect URL is correct:
    assert_redirected_to pages_permalink_path(@page.permalink)
  end

  test "should destroy page" do
    assert_difference("Page.count", -1) do
      delete page_url(@page)
    end

    assert_redirected_to pages_url
  end
end
