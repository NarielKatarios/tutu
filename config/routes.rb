Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  resources :routes do
    post :add_station
    post :del_station
  end
  resources :tickets
  resources :users

  get 'welcome/index'
  root 'welcome#index'
end
