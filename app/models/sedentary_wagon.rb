class SedentaryWagon < Wagon
  validates :sedentary_seats, presence: true

  def seat_types
    [:sedentary_seats]
  end
end