class Wagon < ApplicationRecord
  validates :number, presence: true
  belongs_to :train
  has_many :tickets

  scope :economy,   -> { where(type: 'EconomyWagon') }
  scope :coupe,     -> { where(type: 'CoupeWagon') }
  scope :sedentary, -> { where(type: 'SedentaryWagon') }
  scope :sv,        -> { where(type: 'SvWagon') }
  scope :sort_desc, -> { order('number DESC') }
  scope :sort_asc,  -> { order('number') }

  def type_name
    case self.type
      when "EconomyWagon"
        "Плацкарт"
      when "CoupeWagon"
        "Купе"
      when "SvWagon"
        "СВ"
      when "SedentaryWagon"
        "Сидячий"
      else
        "Тип не назначен"
    end
  end

  def self.seats_type(type)
    case type
      when :top_seats
        "Верхние места"
      when :bottom_seats
        "Нижние места"
      when :side_bottom_seats
        "Боковые нижние места"
      when :side_top_seats
        "Боковые верхние места"
      when :sedentary_seats
        "Сидячие места"
      else
        "Тип не назначен"
    end
  end

  def set_wagon_number
    train.wagons == [] ? 1 : train.wagons.maximum(:number) + 1
  end

  def seats_count_for_wagon_type
    seat_types.map do |seat_type|
      self.class.where(type: type, train_id: train_id).map(&seat_type).sum
    end.sum
  end
end