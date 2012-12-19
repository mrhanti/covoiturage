class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string  :destination
      t.string  :departure
      t.string  :departure_on
      t.string  :departure_at
  
      t.integer :seat_limit
      t.float   :price_per_seat
 
      # t.string :duration
      # t.string :distance

      t.boolean :highway, :default => false
      t.string  :itinerary

      t.timestamps
    end
  end

  def down
    drop_table :ads
  end
end
