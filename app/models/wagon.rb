class Wagon < ApplicationRecord
  validates :number, presence: true
  belongs_to :train
  has_many :tickets

  WAGON_TYPES = [['Плацкарт', 'EconomyWagon'], ['Купе', 'CoupeWagon'], ['Сидячий', 'SedentaryWagon'], ['СВ', 'SvWagon']]
  scope :economy,   -> { where(type: 'EconomyWagon') }
  scope :coupe,     -> { where(type: 'CoupeWagon') }
  scope :sedentary, -> { where(type: 'SedentaryWagon') }
  scope :sv,        -> { where(type: 'SvWagon') }
  scope :sort_desc, -> { order('number DESC') }
  scope :sort_asc,  -> { order('number') }

  def type_name
    case self.type
      when "EconomyWagon"   then "Плацкарт"
      when "CoupeWagon"     then "Купе"
      when "SvWagon"        then "СВ"
      when "SedentaryWagon" then "Сидячий"
      else "Тип не назначен"
    end
  end

  def self.seats_type(type)
    case type
      when :top_seats         then "Верхние места"
      when :bottom_seats      then "Нижние места"
      when :side_bottom_seats then "Боковые нижние места"
      when :side_top_seats    then "Боковые верхние места"
      when :sedentary_seats   then "Сидячие места"
      else "Тип не назначен"
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