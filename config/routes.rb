Rails.application.routes.draw do
  resources :trains do
    resources :wagons, shallow: true
    resources :tickets
    post :add_route
    post :del_route
  end
  resources :railway_stations do
    patch :update_time_and_position, on: :member
  end
  resources :routes do
    resources :railway_stations
    post :add_station
    post :del_station
    post :increase_station_number
    post :decrease_station_number
  end
  resources :tickets
  resources :users do
    resources :tickets

  end
  resources :wagons

  get 'search/index'
  post :search, to: 'search#search'

  get 'welcome/index'
  root 'welcome#index'
end
