class Wagon < ApplicationRecord
  validates :number, presence: true
  #:wagon_type, :seats_up, :seats_down,
  belongs_to :train
  has_many :tickets

  #default_scope { order(:number) } #сортировка в вызове алл по номеру

  scope :economy, -> { where(type: 'EconomyWagon') }
  scope :coupe, -> { where(type: 'CoupeWagon') }
  scope :sedentary, -> { where(type: 'SedentaryWagon') }
  scope :s_v, -> { where(type: 'SVWagon') }
  scope :ordered, -> {order(:number)}
end