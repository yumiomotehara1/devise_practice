require "test_helper"

class OpenPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get open_pages_top_url
    assert_response :success
  end

  test "should get mypage" do
    get open_pages_mypage_url
    assert_response :success
  end
end
