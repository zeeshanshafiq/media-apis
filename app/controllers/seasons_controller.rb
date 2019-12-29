class SeasonsController < ApplicationController

  def index
    seansons = Season.includes(:episodes).all
    render json: seansons.as_json(include: :episodes)
  end

end