class AddStripeIdToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :stripe_id, :string
  end
end
