class UsersController < ApplicationController

  def library
    @user = User.find(params[:id])
   render json: @user.purchases.as_json(include: :purchaseable)
  end

  def purchase
    user = User.find(params[:id])
    media = user.purchase_media(media_id: params[:media_id], media_type: params[:media_type], purchase_option_id: params[:purchase_option_id])
    unless media.errors.any?
      render json: media
    else
      render json: media.errors, status: :unprocessable_entity
    end
  end

end
