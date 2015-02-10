class AddStripeLeaseParamsToLeases < ActiveRecord::Migration
  def change
    add_column :leases, :stripe_id, :string
    add_column :leases, :name, :string
    add_column :leases, :description, :string
    add_column :leases, :amount, :string
    add_column :leases, :integer, :string
    add_column :leases, :interval, :string
    add_column :leases, :published, :string
    add_column :leases, :boolean, :string
  end
end
