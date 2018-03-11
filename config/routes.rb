Rails.application.routes.draw do
  resources :trains do
    resource :wagons
    resource :tickets
    post :add_route
    post :del_route
  end
  resources :railway_stations
  resources :routes do
    resource :railway_stations
    post :add_station
    post :del_station
    post :increase_station_number
    post :decrease_station_number
  end
  resources :tickets
  resources :users
  resources :wagons
  get 'welcome/index'
  root 'welcome#index'
end
