class Artist < ActiveRecord::Base
  has_many :artworks
  has_many :movements, through: :artworks

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Artist.all.find{|a| a.slug == slug}
  end

end
