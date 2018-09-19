require 'test_helper'

class JobSeekerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get job_seeker_new_url
    assert_response :success
  end

end
