class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
    	t.string :stripe_id
    	t.references :tenant
    	
      t.timestamps null: false
    end
  end
end

