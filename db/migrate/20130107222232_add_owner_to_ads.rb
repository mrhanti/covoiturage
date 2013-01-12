class AddOwnerToAds < ActiveRecord::Migration
  def change
    add_column :ads, :owner_id, :boolean, :default => false
  end

  def down
  	remove_column :ads, :owner_id, :boolean
  end
end
