class Carriage < ApplicationRecord
  belongs_to :train

  validate :number, :top_seats, :bottom_seats, presence: true

  #default_scope { order(:number) } #сортировка в вызове алл по номеру

  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe, -> { where(type: 'CoupeCarriage') }
  scope :ordered, -> {order(:number)}
end
