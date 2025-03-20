require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get show" do
    get book_url(books(:one))
    assert_response :success
  end
end
