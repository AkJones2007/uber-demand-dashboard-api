class DemandLogsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # List all logs
  def index
    logs = DemandLog.all
    render json: logs
  end

  # Find log by ID
  def show
    log = DemandLog.find(params[:id])
    render json: log
  end

  # Find averages grouped by time
  def find
    method = params[:method]

    if params.has_key?(:market_id)
      market = Market.find(params[:market_id])
      logs = []

      market.areas.each do |area|
        area_logs = area.demand_logs.send(method)
        area_logs.each do |log|
          logs.push(log)
        end
      end

      render json: logs

    elsif params.has_key?(:area_id)
      area_id = params[:area_id]
      logs = DemandLog.where(area_id: area_id).send(method)
      render json: logs
    end
  end

  # Add a new log
  def create
    log = DemandLog.new(log_params)

    if log.save
      render json: log
    else
      render json: log.errors, status: :unprocessable_entity
    end
  end

  # Update an existing log
  def update
    log = DemandLog.find(params[:id])

    if log.update(log_params)
      render json: log
    else
      render json: log.errors, status: :unprocessable_entity
    end
  end

  # Remove a log
  def destroy
    log = DemandLog.find(params[:id])

    if log.destroy
      render text: 'OK', status: :ok
    else
      render json: log.errors, status: :not_found
    end
  end

  private

  def log_params
    params.require(:demand_log).permit(:surge_multiplier, :product, :area_id)
  end

end
