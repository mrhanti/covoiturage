class AddPoolersIdsToAds < ActiveRecord::Migration
  def change
    add_column :ads, :poolers_ids, :text
  end
end
