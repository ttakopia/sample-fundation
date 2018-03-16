require 'test_helper'

class StapageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get stapage_home_url
    assert_response :success
  end

end
