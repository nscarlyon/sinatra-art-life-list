class User < ActiveRecord::Base
  has_many :artworks
  has_many :artists
  has_many :movements
  has_many :artwork_movements
  has_secure_password

  def slug
    self.username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|u| u.slug == slug}
  end

end
