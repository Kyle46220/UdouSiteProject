class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :title
      t.text :description
      t.text :image_upload
      t.references :cart

      t.timestamps
    end
  end
end
