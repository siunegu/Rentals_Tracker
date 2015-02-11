class AddLandlordIdToLease < ActiveRecord::Migration
  def change
  	add_column :leases, :landlord_id, :integer
  end
end


