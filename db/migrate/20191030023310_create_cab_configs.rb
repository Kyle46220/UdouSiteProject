class CreateCabConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :cab_configs do |t|
      t.float :height
      t.float :width
      t.float :depth
      t.integer :style
      t.integer :colour
      t.integer :shelf_qty
      t.integer :drawer_qty
      t.integer :cupboard_qty
      t.boolean :back_panel
      t.references :profile, foreign_key: true
      t.references :collection

      t.timestamps
    end
  end
end
