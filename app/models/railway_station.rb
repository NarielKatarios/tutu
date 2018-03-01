class RailwayStation < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

end
