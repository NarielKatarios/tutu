class Train < ApplicationRecord
  validates :number, presence: true
  validates :number, uniqueness: true

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons

  validates :wagon_id, uniqueness: { scope: :train_id }

end
