class RemovePublicFromCollection < ActiveRecord::Migration[5.2]
  def change
    remove_column :collections, :public, :boolean
  end
end
