class MoviesControllerTest < BaseControllerTest

  def test_index
    get movies_path
    last_response = JSON.parse(response.body)

    assert_response :success
    assert_equal Movie.count, last_response.size
  end

end