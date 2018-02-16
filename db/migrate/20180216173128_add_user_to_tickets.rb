class AddUserToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :user_name, :string
    add_column :tickets, :user_surname, :string
    add_column :tickets, :user_patronymic, :string
    add_column :tickets, :start_station_id, :integer
    add_column :tickets, :end_station_id, :integer
  end
end
