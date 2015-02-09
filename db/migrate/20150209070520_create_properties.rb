class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
    	t.string :address
      t.text :description
    	t.string :city
    	t.string :state
    	t.integer :price
    	t.references :landlord, index: true
      t.timestamps null: false
    end
    add_foreign_key :properties, :landlords
  end
end
