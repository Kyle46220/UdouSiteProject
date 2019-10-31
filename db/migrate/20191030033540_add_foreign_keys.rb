class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key "cab_configs", "collections"
    add_foreign_key "cart_items", "carts"
     add_foreign_key "profiles", "users"
     add_foreign_key "carts", "profiles"
   
    add_foreign_key "reviews", "carts"
    add_foreign_key "uploads", "cab_configs"
    
  end
end
