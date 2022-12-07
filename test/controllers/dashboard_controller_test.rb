require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end

  test "should get profile" do
    get dashboard_profile_url
    assert_response :success
  end

  test "should get super_secret" do
    get dashboard_super_secret_url
    assert_response :success
  end
end
