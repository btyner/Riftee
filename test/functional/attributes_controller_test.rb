require 'test_helper'

class AttributesControllerTest < ActionController::TestCase
  test "should get :index" do
    get ::index
    assert_response :success
  end

end
