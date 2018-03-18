class SearchController < ApplicationController
  def index
    @routes = []
  end

  def search
    first_station = RailwayStation.find params[:first_station_id]
    last_station = RailwayStation.find params[:last_station_id]
    routes = Route.all.select do |route|
      route if (route.railway_stations & [first_station, last_station]).size == 2
    end
    @trains = []
    routes.each do |route|
      train = {}
      train[:trains] = route.trains
      train[:arrival_time] = route.railway_stations_routes.find_by(railway_station: first_station).arrival_time&.strftime('%H:%M')
      train[:departure_time] = route.railway_stations_routes.find_by(railway_station: last_station).departure_time&.strftime('%H:%M')
      @trains << train
    end
    #byebug
    render :search
  end
end
