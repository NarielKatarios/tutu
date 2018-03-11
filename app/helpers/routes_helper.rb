module RoutesHelper

  def route_full_name route
    route.railway_stations_routes.first.railway_station.title + ' - ' +
    route.railway_stations_routes.last.railway_station.title
  end
end
