class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all

  end

  def new
    @attraction = Attraction.new

  end

  def create
    binding.pry
    @attraction = Attraction.new(attraction_params)
    @attraction.save
    redirect_to @attraction


  end

  def show 
    @attraction = Attraction.find(params[:id])

  end


  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
  end

end