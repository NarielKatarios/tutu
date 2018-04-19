class AddAssociationsToTickets < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :tickets, :wagon
    add_belongs_to :tickets, :railway_station
  end
end
