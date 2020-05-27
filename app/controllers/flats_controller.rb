class FlatsController < ApplicationController


  before_action :find_flat, only: [:show, :edit, :update, :destroy]
  def index
    @flats = Flat.all
    if params[:search]
      if params[:search][:query]
        @flatresult = Flat.where(name: params[:search][:query])[0]
        redirect_to flat_path(@flatresult)
      end
    end
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flats_params)
    @flat.save

    redirect_to flats_path
  end

  def edit
  end

  def update
    flat.update(flats_params)

    redirect_to task_path
  end

  def destroy
    @flat.destroy

    redirect_to flats_path
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flats_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
