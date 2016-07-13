artworks_list = {
    "Tree of Life" => {
      :medium => "painting"
    },
    "The Scream" => {
      :medium => "painting"
    },
    "The Thinker" => {
      :medium => "sculpture"
    },
    "Laocoon and his Sons" => {
      :medium => "sculpture"
    },
    "Sistine Chapel" => {
      :medium => "architecture"
    },
    "The Forbiddon City" => {
      :medium => "architecture"
    }
  }

artworks_list.each do |name, medium_hash|
  p = Artwork.new
  p.name = name
  medium_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end

artists_list = {
    "Klimt" => {
    },
    "Rodin" => {
    },
    "Edvard Munch" => {
    },
    "" => {
    }
  }

artists_list.each do |name, figure_hash|
  p = Artist.new
  p.name = name
  p.save
end


title_list = {
    "The Mayor" => {
    },
    "The Don" => {
    },
    "Mr. President" => {
    }
  }

title_list.each do |name, figure_hash|
  p = Title.new
  p.name = name
  p.save
end
