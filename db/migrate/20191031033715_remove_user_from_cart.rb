class RemoveUserFromCart < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :user_id, foreign_key: true
  end
end
