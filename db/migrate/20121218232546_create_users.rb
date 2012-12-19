class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :phone_number
      t.string  :year_of_birth
      t.string  :gender
      t.boolean :admin, :default => false
      t.timestamps
    end
  end

  def down
  	drop_table :users
  end
end
