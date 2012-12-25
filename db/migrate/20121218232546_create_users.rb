class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name, :null => false
      t.string  :last_name, :null => false
      t.string  :email, :null => false
      t.string  :phone_number, :null => false
      t.integer :year_of_birth, :null => false
      t.string  :gender
      t.boolean :admin, :default => false
      t.timestamps
    end
  end

  def down
  	drop_table :users
  end
end
