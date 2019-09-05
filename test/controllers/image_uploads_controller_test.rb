require 'test_helper'

class ImageUploadsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get image_uploads_create_url
    assert_response :success
  end

end
