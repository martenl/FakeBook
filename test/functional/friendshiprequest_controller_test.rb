require 'test_helper'

class FriendshiprequestControllerTest < ActionController::TestCase
  test "should get accept" do
    get :accept
    assert_response :success
  end

  test "should get offer" do
    get :offer
    assert_response :success
  end

end
