class Movement < ActiveRecord::Base
  has_many :artwork_movements
  has_many :artworks, though: :artwork_movements

end
