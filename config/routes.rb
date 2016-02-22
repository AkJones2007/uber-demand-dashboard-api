Rails.application.routes.draw do

  # Markets
  resources :markets, except: [:new, :edit]

  # Areas
  resources :areas, except: [:new, :edit]
  get '/areas/market/:id' => 'areas#index_by_market'

  # Demand Logs
  resources :demand_logs, except: [:new, :edit]
end
