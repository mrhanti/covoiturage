class RenamePoolRequests < ActiveRecord::Migration
  def up
  	rename_table :pool_requests, :reservations
  end

  def down
  	rename_table :reservations, :pool_requests
  end
end
