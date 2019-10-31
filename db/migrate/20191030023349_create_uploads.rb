class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :uploads do |t|
      t.text :image_upload
      t.references :cab_config

      t.timestamps
    end
  end
end
