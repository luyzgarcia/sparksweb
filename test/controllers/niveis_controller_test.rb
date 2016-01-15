require 'test_helper'

class NiveisControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get novo" do
    get :novo
    assert_response :success
  end

end
