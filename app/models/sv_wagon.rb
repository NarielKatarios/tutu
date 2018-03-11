class SvWagon < Wagon
  validates :bottom_seats, presence: true

  def seat_types
    [:bottom_seats]
  end
end