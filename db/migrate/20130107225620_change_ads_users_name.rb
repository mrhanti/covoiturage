class ChangeAdsUsersName < ActiveRecord::Migration
  def up
  	rename_table :users_ads, :ads_users
  end

  def down
  end
end
