require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get register" do
    get register_path
    assert_response :success
  end
  
  test "should get info" do
    get race_information_path
    assert_response :success
  end

  test "should get admin" do
    get admin_page_path
    assert_response :success
  end
end
