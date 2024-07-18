require "test_helper"

class Web::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get web_users_new_url
    assert_response :success
  end

  test "should get create" do
    get web_users_create_url
    assert_response :success
  end

  test "should get verify" do
    get web_users_verify_url
    assert_response :success
  end

  test "should get confirm_verification" do
    get web_users_confirm_verification_url
    assert_response :success
  end
end
