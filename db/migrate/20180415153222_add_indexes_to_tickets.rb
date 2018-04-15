class AddIndexesToTickets < ActiveRecord::Migration[5.1]
  def change
    add_index :tickets, :start_station
    add_index :tickets, :end_station
  end
end
