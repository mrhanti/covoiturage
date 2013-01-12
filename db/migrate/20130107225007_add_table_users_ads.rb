class AddTableUsersAds < ActiveRecord::Migration
  def change
    create_table :users_ads do |t|
      t.references :user
      t.references :ad
    end
  end

  def down
    drop_table :users_ads
  end
end
