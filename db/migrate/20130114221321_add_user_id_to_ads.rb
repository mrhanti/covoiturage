class AddUserIdToAds < ActiveRecord::Migration
  def change
    add_column :ads, :user_id, :integer
  end

  def down
  	remove_column :ads, :user_id, :integer
  end
end
