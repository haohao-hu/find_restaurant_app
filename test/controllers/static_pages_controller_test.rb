require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get ote_list" do
    get :ote_list
    assert_response :success
  end

end
