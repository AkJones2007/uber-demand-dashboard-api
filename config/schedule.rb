set :environment, 'development'

every 5.minutes do
  rake 'get_demand_logs'
end
