class CreateArtwork < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :name
      t.string :medium
      t.integer :artist_id
    end
  end
end
