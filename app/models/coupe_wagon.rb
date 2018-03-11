class CoupeWagon < Wagon
  validates :top_seats, :bottom_seats, presence: true

  def seat_types
    [:top_seats, :bottom_seats]
  end
end