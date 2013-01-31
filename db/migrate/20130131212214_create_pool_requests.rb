class CreatePoolRequests < ActiveRecord::Migration
  def change
    create_table :pool_requests do |t|
      t.integer :pooler_id
      t.integer :seats, :null => false
      t.integer :ad_id, :null => false
      t.boolean :seen, :default => false
      t.boolean :confirmed, :default => false
      t.timestamps
    end
  end

  def down
    drop_table :pool_requests
  end
end
