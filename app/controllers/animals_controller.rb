class AnimalsController < ApplicationController

  def index
    animals = Animal.all
    render json:animals
  end

  def show
    animal = Animal.find(params[:id])
    render json:animal.to_json(:include => :sightings)
  end

  def create
    animal = Animal.new(animal_params)
    if animal.save
      render json: animal, status: 201
    else
      render json: animal.errors, status: 422
    end
  end

  def update
    animal = Animal.update(params[:id], animal_params)
    if animal.valid?
      render json: animal, status: 201
    else
      render json: animal.errors, status: 422
    end
  end

  def animal_params
    params.require(:animal).permit(:common_name, :latin_name, :kingdom,[:sightings])
  end

  def destroy
    animals = Animal.all
    animal = Animal.destroy(params[:id])
    if animal.valid?
      # redirect_to :action => :index
      render json: animals, status: 201
    else
      render json: animal.errors, status: 422
    end
  end

end
