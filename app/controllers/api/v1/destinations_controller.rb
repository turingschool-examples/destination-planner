class Api::V1::DestinationsController < ApplicationController
  def index
    render json: DestinationSerializer.render(Destination.all)
  end

  def show
    render json: DestinationSerializer.render(Destination.find(params[:id]))
  end

  def create
    destination = Destination.create(destination_params)
    render json: DestinationSerializer.render(destination)
  end

  def update
    destination = Destination.update(params[:id], destination_params)
    render json: DestinationSerializer.render(destination)
  end

  def destroy
    Destination.destroy(params[:id])
  end

  private

  def destination_params
    params.permit(:name, :zip, :description, :image_url)
  end
end
