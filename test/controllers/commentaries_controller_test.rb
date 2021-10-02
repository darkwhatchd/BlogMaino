require "test_helper"

class CommentariesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get commentaries_create_url
    assert_response :success
  end
end
