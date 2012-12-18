class CreateConfirmations < ActiveRecord::Migration
  def change
    create_table :confirmations do |t|
      t.string  :token
      t.integer :use_count, :default => 0
      t.timestamps
    end
  end

  def down
  	drop_table :confirmations
  end
end
