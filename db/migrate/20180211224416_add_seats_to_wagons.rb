class AddSeatsToWagons < ActiveRecord::Migration[5.1]
  def change
    add_column :wagons, :seats_up, :integer
    add_column :wagons, :seats_down, :integer
  end
end
