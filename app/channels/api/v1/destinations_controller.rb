class Api::V1::DestinationsController < ApplicationController
  def index
    render json: DestinationSerializer.render(Destination.all)
  end
end
