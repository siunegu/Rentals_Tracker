class RemoveIntegerTypoFromLeases < ActiveRecord::Migration
  def change
  	remove_column :leases, :integer
  end
end
