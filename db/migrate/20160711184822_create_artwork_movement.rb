class CreateArtworkMovement < ActiveRecord::Migration
  def change
    create_table :artwork_movements do |t|
      t.integer :artwork_id
      t.integer :movement_id
    end
  end
end
