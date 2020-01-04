class MediaControllerTest < BaseControllerTest

  def test_index
    get media_path
    last_response = JSON.parse(response.body)

    assert_response :success
    assert_equal ['movies', 'seasons'], last_response.keys
  end

end
