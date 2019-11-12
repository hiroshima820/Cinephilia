require 'test_helper'

class WatchedsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get watcheds_new_url
    assert_response :success
  end

end
