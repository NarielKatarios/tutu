class Wagon < ApplicationRecord
  validates :number, presence: true
  belongs_to :train
  has_many :tickets

  scope :economy,   -> { where(type: 'EconomyWagon') }
  scope :coupe,     -> { where(type: 'CoupeWagon') }
  scope :sedentary, -> { where(type: 'SedentaryWagon') }
  scope :s_v,       -> { where(type: 'SVWagon') }
  scope :sort_desc, -> { order('number DESC') }
  scope :sort_asc,  -> { order('number') }

  before_save :set_wagon_number

  def type_name
    case self.type
      when "EconomyWagon"
        "Плацкарт"
      when "CoupeWagon"
        "Купе"
      when "SVWagon"
        "СВ"
      when "SedentaryWagon"
        "Сидячий"
      else
        "Тип не назначен"
    end
  end

  def set_wagon_number
    number = 0
    if train.wagons == []
      number = 1
    else
      number += train.wagons.maximum(:number)
    end
  end
end