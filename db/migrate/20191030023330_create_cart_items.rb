class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :cab_config, foreign_key: true
      t.references :cart

      t.timestamps
    end
  end
end
