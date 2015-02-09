class AddPropertyIdToLeases < ActiveRecord::Migration
  def change
    add_column :leases, :property_id, :integer
  end
end
