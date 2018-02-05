class Route < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains
  has_many :tickets
end
