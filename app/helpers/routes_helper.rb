module RoutesHelper

  def route_full_name route
    return if route.railway_stations_routes.map(&:position).include? nil
    r = route.railway_stations_routes.sort_by { |k| k.position }
    r.first.railway_station.title + ' - ' + r.last.railway_station.title
  end
end
