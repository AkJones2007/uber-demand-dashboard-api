class AreasController < ApplicationController

  # Show all areas
  def index
    areas = Area.all
    render json: areas
  end

  # Show all areas in a market
  def index_by_market
    market = Market.find(params[:id])
    areas = market.areas
    render json: areas
  end

  # Show one area
  def show
    area = Area.find(params[:id])
    render json: area
  end

  # Create a new area
  def create
    area = Area.new(area_params)

    if area.save
      render json: area
    else
      render json: area.errors, status: :unprocessable_entity
    end
  end

  # Update an existing area
  def update
    area = Area.find(params[:id])

    if area.update(area_params)
      render json: area
    else
      render json: area.errors, status: :unprocessable_entity
    end
  end

  #Remove an area
  def destroy
    area = Area.find(params[:id])

    if area.destroy
      render text: 'OK', status: :ok
    else
      render json: area.errors, status: :not_found
    end
  end

  private

  def area_params
    params.require(:area).permit(:name, :latitude, :longitude, :market_id)
  end

end
