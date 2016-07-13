class Movement < ActiveRecord::Base
  has_many :artwork_movements
  has_many :artworks, through: :artwork_movements
  has_many :artists, through: :artworks

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Movement.all.find{|a| a.slug == slug}
  end

end
