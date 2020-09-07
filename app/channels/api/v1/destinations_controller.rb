class Api::V1::DestinationsController < ApplicationController
  def index
    render json: DestinationSerializer.render(Destination.all)
  end

  def show
    render json: DestinationSerializer.render(Destination.find(params[:id]))
  end
end
