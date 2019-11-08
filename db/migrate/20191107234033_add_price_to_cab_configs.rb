class AddPriceToCabConfigs < ActiveRecord::Migration[5.2]
  def change
    add_column :cab_configs, :price, :decimal, default: 1.0
  end
end
