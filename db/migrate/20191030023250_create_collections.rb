class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.string :name
      t.references :profile, foreign_key: true
      t.boolean :public

      t.timestamps
    end
  end
end
