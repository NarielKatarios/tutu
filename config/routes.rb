Rails.application.routes.draw do
  devise_for :users

  resources :tickets

  namespace :admin do
    resources :trains do
      resources :wagons
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
    end
    resources :users, except: :new do
      resources :tickets
    end
    resources :wagons
    resources :tickets
  end

  post :search, to: 'search#search'
  get 'search/index'
  get 'welcome/index'
  root 'welcome#index'
end
