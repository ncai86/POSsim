require 'test_helper'

class ReceiptsControllerTest < ActionController::TestCase
  test "should get get_receipt" do
    get :get_receipt
    assert_response :success
  end

end
