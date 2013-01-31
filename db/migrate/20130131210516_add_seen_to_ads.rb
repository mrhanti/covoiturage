class AddSeenToAds < ActiveRecord::Migration
  def change
    add_column :ads, :seen, :integer, :default => 0
  end

  def down
  	add_column :ads, :seen, :integer
  end
end
