class AddPublicDisplayToCollections < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :public_display, :boolean
  end
end
