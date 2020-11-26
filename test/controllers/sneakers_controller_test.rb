require 'test_helper'

class SneakersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sneakers_index_url
    assert_response :success
  end

  test "should get show" do
    get sneakers_show_url
    assert_response :success
  end

end
