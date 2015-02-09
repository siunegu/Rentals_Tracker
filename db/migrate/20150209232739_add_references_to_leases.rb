class AddReferencesToLeases < ActiveRecord::Migration
  def change
  	remove_column :properties, :tenant_id, :integer
  	add_column :leases, :tenant_id, :integer
  end
end
