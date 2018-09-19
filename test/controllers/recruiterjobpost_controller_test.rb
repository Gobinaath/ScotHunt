require 'test_helper'

class RecruiterjobpostControllerTest < ActionDispatch::IntegrationTest
  test "should get recruiterjobpost" do
    get recruiterjobpost_recruiterjobpost_url
    assert_response :success
  end

end
