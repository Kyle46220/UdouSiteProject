class AddProfileToCart < ActiveRecord::Migration[5.2]
  def change
    add_reference :carts, :profile, foreign_key: true
  end
end
