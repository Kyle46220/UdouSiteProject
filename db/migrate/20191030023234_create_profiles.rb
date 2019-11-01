class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :user_type
      t.boolean :email_opt_in
      t.references :user

      t.timestamps
    end
  end
end
