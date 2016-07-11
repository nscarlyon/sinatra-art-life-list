class CreateMovement < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.string :name
    end
  end
end
