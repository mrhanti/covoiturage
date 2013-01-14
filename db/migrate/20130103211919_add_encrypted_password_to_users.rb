class AddEncryptedPasswordToUsers < ActiveRecord::Migration
  def change
    # Encryptable
    add_column :users, :encrypted_password,     :string
    add_column :users, :password_salt,          :string
    
    # Confirmable   
    add_column :users, :confirmation_token,     :string
    add_column :users, :confirmed_at,           :time
    add_column :users, :confirmation_sent_at,   :time
    add_column :users, :unconfirmed_email,      :string

    # Recoverable
    add_column :users, :reset_password_token,   :string
    add_column :users, :reset_password_sent_at, :time

    # Rememberable
    add_column :users, :remember_created_at,    :time

    # Trackable
    add_column :users, :sign_in_count,          :integer, :default => 0
    add_column :users, :current_sign_in_at,     :time
    add_column :users, :last_sign_in_at,        :time
    add_column :users, :current_sign_in_ip,     :string
    add_column :users, :last_sign_in_ip,        :string
  end
end
