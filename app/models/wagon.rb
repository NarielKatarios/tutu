class Wagon < ApplicationRecord
  validates :number, :wagon_type, :seats_up, :seats_down, presence: true

  belongs_to :train
  has_many :tickets
end