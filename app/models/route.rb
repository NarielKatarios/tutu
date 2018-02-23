class Route < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validate :stations_count

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains
  has_many :tickets

  before_validation :set_title

  scope :station, -> { where(type: 'RailwayStation') }
  scope :ordered, -> {order(:number)}

  private

  def set_title
    self.title = "#{railway_stations.first.title}-#{railway_stations.last.title}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Маршрут должен содержать минимум 2 станции")
    end
  end
end
