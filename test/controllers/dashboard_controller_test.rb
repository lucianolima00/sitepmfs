require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard-admin" do
    get dashboard_dashboard-admin_url
    assert_response :success
  end

end
