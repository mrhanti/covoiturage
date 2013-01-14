class AddSmokingToUsers < ActiveRecord::Migration
  def up
    add_column :users, :smoking_allowed, :boolean, :default => false
    add_column :users, :luggage_allowed, :boolean, :default => true
    add_column :users, :luggage_weight,  :float,   :default => 5
    add_column :users, :music_allowed,   :boolean, :default => true
  end

  def down
  	remove_column :users, :smoking_allowed, :boolean
    remove_column :users, :luggage_allowed, :boolean
    remove_column :users, :luggage_weight,  :float
    remove_column :users, :music_allowed,   :boolean
  end
end
