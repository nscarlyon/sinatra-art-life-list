class CreateArtwork < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :name
      t.string :medium
    end
  end
end
