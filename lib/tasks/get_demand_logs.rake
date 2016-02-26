desc 'Get surge data from the Uber API, and add as a new demand_log'
task :get_demand_logs => :environment do
  uber = Uber.new
  markets = Market.all

  markets.each do |market|
    areas = market.areas.all
    areas.each do |area|
      surge_data = uber.get_surge_data(area['latitude'], area['longitude'])
      surge_data.each do |log_params|
        area.demand_logs.create!(log_params)
      end
    end
  end

end
