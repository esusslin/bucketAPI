class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name

      t.float :checking
      t.float :savings
      t.float :annual
      t.float :monthly

      t.timestamps
    end
  end
end
