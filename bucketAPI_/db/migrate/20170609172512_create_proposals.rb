class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|

	  t.string :item
      t.float :price
      t.float :monthly_payments
      t.integer :months

      t.timestamps
    end
  end
end
