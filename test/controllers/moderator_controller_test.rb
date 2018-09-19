require 'test_helper'

class ModeratorControllerTest < ActionDispatch::IntegrationTest
  test "should get moderator" do
    get moderator_moderator_url
    assert_response :success
  end

end
