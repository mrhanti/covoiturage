class AddSmokingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :smoking_allowed, :boolean, :default => false
    add_column :users, :luggage_allowed, :boolean, :default => true
    add_column :users, :luggage_weight,  :float,   :default => 5
    add_column :users, :music_allowed,   :boolean, :default => true
    # add_column :users, :blabla_allowed,  :boolean, :default => true
    add_column :users, :multi_stop,      :boolean, :default => false
    add_column :users, :usual,           :boolean, :default => false
  end

  def up
  	remove_column :users, :smoking_allowed, :boolean
    remove_column :users, :luggage_allowed, :boolean
    remove_column :users, :luggage_weight,  :float
    remove_column :users, :music_allowed,   :boolean
    remove_column :users, :multi_stop,      :boolean
    remove_column :users, :usual,           :boolean
  end
end
