class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all

  end

  def new
    @attraction = Attraction.new

  end

  def create

    @attraction = Attraction.new(attraction_params)
    @attraction.save
    redirect_to @attraction


  end

  def show 
    @attraction = Attraction.find(params[:id])

  end

  def edit
    @attraction = Attraction.find(params[:id])
  end


  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)

  end


  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
  end

end