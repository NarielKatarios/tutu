class EconomyWagon < Wagon
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, presence: true

  def seat_types
    [:top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats]
  end
end