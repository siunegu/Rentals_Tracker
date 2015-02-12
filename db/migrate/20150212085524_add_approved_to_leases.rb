class AddApprovedToLeases < ActiveRecord::Migration
  def change
    add_column :leases, :approved, :boolean, default: false
  end
end
