require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get list_shirts" do
    get users_list_shirts_url
    assert_response :success
  end
end
