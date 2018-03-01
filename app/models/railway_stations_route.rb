class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :route
  has_many :station_number

  validates :railway_station_id, uniqueness: { scope: :route_id }

  def station_name(find_id)
    RailwayStation.find_by(id, find_id).name
  end
end