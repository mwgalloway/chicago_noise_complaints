class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.all
  end

  def show
    @neighborhood = Neighborhood.find_by(id: params[:id])
    respond_to format.json
    render json: @neighborhood.to_hash
  end
end
