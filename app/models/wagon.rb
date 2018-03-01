class Wagon < ApplicationRecord
  validates :number, presence: true
  #:wagon_type, :seats_up, :seats_down,
  belongs_to :train
  has_many :tickets

  #default_scope { order(:number) } #сортировка в вызове алл по номеру

  scope :economy,   -> { where(type: 'EconomyWagon') }
  scope :coupe,     -> { where(type: 'CoupeWagon') }
  scope :sedentary, -> { where(type: 'SedentaryWagon') }
  scope :s_v,       -> { where(type: 'SVWagon') }
  scope :ordered,   -> { order(:number) }

  scope :sort_number_up,   -> { order('number DESC') }
  scope :sort_number_down, -> { order('number') }

  before_save     :set_wagon_number

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
    if train.wagons == []
      number = 1
    else
      unless train.wagons.maximum(:number) == nil
        number = train.wagons.maximum(:number) + 1
      end
    end
  end
end