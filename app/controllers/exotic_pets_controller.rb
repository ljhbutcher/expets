class ExoticPetsController < ApplicationController
  # Allow unauthenticated users to view the index and show actions
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @exotic_pets = ExoticPet.all
  end

  def show
    @exotic_pet = ExoticPet.find(params[:id])
  end

  def new
    @exotic_pet = ExoticPet.new
  end

  def create
    @exotic_pet = ExoticPet.new(exotic_pet_params)
    @exotic_pet.user = current_user

    if @exotic_pet.save
      redirect_to @exotic_pet
    end
  end

  private

  def exotic_pet_params
    params.require(:exotic_pet).permit(:name, :age, :description, :image_url)
  end
end
