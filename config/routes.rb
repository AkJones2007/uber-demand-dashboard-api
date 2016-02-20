Rails.application.routes.draw do
  resources :markets, except: [:new, :edit]
  resources :areas, except: [:new, :edit]
  resources :demand_logs, except: [:new, :edit]
end
