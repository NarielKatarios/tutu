class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
        t.integer :number
        t.belongs_to :user, index: true

        t.timestamps
    end
  end
end
