class ChangePriceToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :cab_configs, :price, :integer, default: 1
  end
end
