class Ticket < ApplicationRecord
  validates :number, presence: true

  belongs_to :train
  belongs_to :wagon
  belongs_to :railway_station
  belongs_to :user
  belongs_to :user_name
  belongs_to :user_surname
  belongs_to :user_patronymic
end