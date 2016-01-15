require 'test_helper'

class RegistrosControllerTest < ActionController::TestCase
  test "should get verifica_servidor" do
    get :verifica_servidor
    assert_response :success
  end

end
