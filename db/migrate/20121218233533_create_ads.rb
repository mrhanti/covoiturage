class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string  :destination, :null => false
      t.string  :departure, :null => false
      
      t.date    :departure_on, :null => false
      t.time    :departure_at, :null => false
  
      t.integer :seat_limit, :null => false
      t.float   :price_per_seat, :null => false
 
      # t.string :duration
      # t.string :distance

      t.boolean :highway, :default => false
      t.text    :itinerary

      t.timestamps
    end
  end

  def down
    drop_table :ads
  end
end
