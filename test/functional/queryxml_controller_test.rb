require 'test_helper'

class QueryxmlControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
