class CreateProfilePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_photos do |t|
      t.string :image
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
