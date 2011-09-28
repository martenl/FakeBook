require 'test_helper'

class MessageControllerTest < ActionController::TestCase
  test "should get read" do
    get :read
    assert_response :success
  end

  test "should get write" do
    get :write
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

end
