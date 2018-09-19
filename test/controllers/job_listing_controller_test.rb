require 'test_helper'

class JobListingControllerTest < ActionDispatch::IntegrationTest
  test "should get job_listing" do
    get job_listing_job_listing_url
    assert_response :success
  end

end
