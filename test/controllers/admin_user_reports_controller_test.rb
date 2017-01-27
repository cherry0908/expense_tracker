require 'test_helper'

class AdminUserReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_user_reports_index_url
    assert_response :success
  end

end
