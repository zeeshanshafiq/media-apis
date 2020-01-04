class UsersControllerTest < BaseControllerTest

  def test_library
    post purchase_media_user_path(media_type: 'season', media_id: @season.id, purchase_option_id: @po1.id, id: @user.id)

    get library_user_path(@user)
    last_response = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, last_response.size

    #travel time to expiry
    travel_to(Purchase.expiry_time+1.minute)
    get library_user_path(@user)
    last_response = JSON.parse(response.body)

    assert_response :success
    assert_equal 0, last_response.size

    #travel time back to original
    travel_back
    get library_user_path(@user)
    last_response = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, last_response.size
  end

  def test_purchase
    post purchase_media_user_path(media_type: 'movie', media_id: @movie1.id, purchase_option_id: @po1.id, id: @user.id)
    last_response = JSON.parse(response.body)

    assert_response :success
    assert_equal @movie1.class.name, last_response['purchaseable_type']
    assert_equal @movie1.id, last_response['purchaseable_id'].to_i
    assert_equal @po1.id, last_response['purchase_option_id'].to_i
    assert_equal @user.id, last_response['user_id'].to_i

    post purchase_media_user_path(media_type: 'movie', media_id: @movie1.id, purchase_option_id: @po1.id, id: @user.id)
    last_response = JSON.parse(response.body)

    assert_response :unprocessable_entity
    assert_equal ' already have this Movie.', last_response['user_id'].first
  end
end