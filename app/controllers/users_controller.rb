class UsersController < ApplicationController

  def library
    @user = User.find(params[:id])
   render json: @user.purchases.as_json(include: :purchaseable)
  end

  def purchase
    user = User.find(params[:id])
    purchased, obj = user.purchase_media(media_id: params[:media_id], media_type: params[:media_type], purchase_option_id: params[:purchase_option_id])
    if purchased
      render json: obj
    else
      render json: obj.errors, status: :unprocessable_entity
    end
  end

end
