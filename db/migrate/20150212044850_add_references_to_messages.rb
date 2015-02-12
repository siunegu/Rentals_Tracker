class AddReferencesToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :landlord, index: true
    add_foreign_key :messages, :landlords
    add_reference :messages, :tenant, index: true
    add_foreign_key :messages, :tenants
  end
end
