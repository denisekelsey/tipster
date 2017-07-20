require 'test_helper'

class MeaderyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meadery_index_url
    assert_response :success
  end

end
