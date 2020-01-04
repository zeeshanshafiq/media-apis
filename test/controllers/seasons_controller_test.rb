class SeasonsControllerTest < BaseControllerTest

  def test_index
    get seasons_path
    last_response = JSON.parse(response.body)

    assert_response :success
    assert_equal Season.count, last_response.size
  end

end