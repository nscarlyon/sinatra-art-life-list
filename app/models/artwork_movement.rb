class ArtworkMovement < ActiveRecord::Base
  belongs_to :artwork
  belongs_to :movement
end
