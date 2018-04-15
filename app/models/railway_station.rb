class RailwayStation < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true

  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets

  scope :ordered, -> { select('railway_stations.*, railway_stations_routes.position').joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def update_time_and_position(route, position, arrival_time, departure_time)
    station_route = station_route(route)
    station_route.update(position: position, arrival_time: arrival_time, departure_time: departure_time) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def arrival_time(route)
    station_route(route).try(:arrival_time)&.strftime('%H:%M')
  end

  def departure_time(route)
    station_route(route).try(:departure_time)&.strftime('%H:%M')
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
