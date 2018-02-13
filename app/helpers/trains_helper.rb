module TrainsHelper
  def full_name(train)
    "<#{train.number.to_s}> #{train.route.railway_stations.first.title} - #{train.route.railway_stations.last.title}"
  end
end
