class AddSortByTailToTrains < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :sort_by_tail, :boolean
  end
end
