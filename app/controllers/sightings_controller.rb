class SightingsController < ApplicationController

  def index
    if params[:start_date] && params[:end_date]
      @sighting = Sighting.where(event: params[:start_date]..params[:end_date])
      render json: @sighting
    else
      @sightings = Sighting.all
      render json: @sightings
    end
  end

  def show
    sighting = Sighting.find(params[:id])
    render json:sighting
  end

  def create
    sighting = Sighting.new(sighting_params)
    if sighting.save
      render json: sighting, status: 201
    else
      render json: sighting.errors, status: 422
    end
  end

  def update
    sighting = Sighting.update(params[:id], sighting_params)
    if sighting.valid?
      render json: sighting, status: 201
    else
      render json: sighting.errors, status: 422
    end
  end

  def sighting_params
    params.require(:sighting).permit(:animal_id, :lat, :long, :event)
  end

  def destroy
    sightings = Sighting.all
    sighting = Sighting.destroy(params[:id])
    if sighting.valid?
      # redirect_to :action => :index
      render json: sightings, status: 201
    else
      render json: sighting.errors, status: 422
    end
  end

end
