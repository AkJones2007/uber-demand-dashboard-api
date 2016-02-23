class MarketsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # Show all markets
  def index
    markets = Market.all
    render json: markets
  end

  # Show market by id
  def show
    market = Market.find(params[:id])
    render json: market
  end

  # Filter markets
  def filter
    markets = Market.where(market_params)
    render json: markets
  end

  # Add a market
  def create
    market = Market.new(market_params)

    if market.save
      render json: market
    else
      render json: market.errors, status: :unprocessable_entity
    end
  end

  def update
    market = Market.find(params[:id])

    if market.update(market_params)
      render json: market
    else
      render json: market.errors, status: :unprocessable_entity
    end
  end

  def destroy
    market = Market.find(params[:id])

    if market.destroy
      render text: 'OK', status: :ok
    else
      render json: market.errors, status: :not_found
    end
  end

  private

  def market_params
    params.require(:market).permit(:country, :region, :city)
  end

end
