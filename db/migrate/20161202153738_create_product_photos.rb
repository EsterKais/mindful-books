class CreateProductPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :product_photos do |t|
      t.string :image
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
