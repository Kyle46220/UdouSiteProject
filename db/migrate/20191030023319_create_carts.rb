class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.boolean :result_of_transaction
      t.timestamp :transaction_date
      t.references :profile

      t.timestamps
    end
  end
end
