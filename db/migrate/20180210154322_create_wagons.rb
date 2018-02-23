class CreateWagons < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|
      t.integer :number
      t.string :wagon_type
      t.integer :number_of_seats
      t.integer :top_seats
      t.integer :side_top_seats
      t.integer :bottom_seats
      t.integer :side_bottom_seats
      t.belongs_to :train
      t.string :type

      t.timestamps
    end
  end
end