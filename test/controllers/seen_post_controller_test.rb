require "test_helper"

class SeenPostControllerTest < ActionDispatch::IntegrationTest
  test "should get mark" do
    get seen_post_mark_url
    assert_response :success
  end
end
