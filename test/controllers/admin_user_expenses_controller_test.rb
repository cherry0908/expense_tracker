require 'test_helper'

class AdminUserExpensesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_user_expenses_index_url
    assert_response :success
  end

end
