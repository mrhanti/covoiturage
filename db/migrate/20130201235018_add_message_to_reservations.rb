class AddMessageToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :message, :text
  end

  def down
  	remove_column :reservations, :message, :text
  end
end
