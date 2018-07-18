require 'test_helper'

class ReceiverControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get receiver_new_url
    assert_response :success
  end

  test "should get create" do
    get receiver_create_url
    assert_response :success
  end

  test "should get show" do
    get receiver_show_url
    assert_response :success
  end

end
