class Artist < ActiveRecord::Base
  has_many :artworks
  has_many :movements, through: :artworks
end
