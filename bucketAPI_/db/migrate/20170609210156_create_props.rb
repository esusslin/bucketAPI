class CreateProps < ActiveRecord::Migration[5.1]
  def change
    create_table :props do |t|
      t.string :item
      t.float :price
      t.float :monthly_payments
      t.integer :months
      
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
