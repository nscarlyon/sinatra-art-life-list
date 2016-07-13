artists_list = {
    "Klimt" => {
    },
    "Rodin" => {
    },
    "Edvard Munch" => {
    },
    "Raphael" => {
    }
  }

artists_list.each do |name, figure_hash|
  p = Artist.new
  p.name = name
  p.save
end


movements_list = {
    "Symbolism" => {
    },
    "Abstract" => {
    },
    "Expressionism" => {
    },
    "Classical Greek" => {
    },
    "Hellenistic Greek" => {
    },
    "High Renaissance" => {
    }
  }

movements_list.each do |name, figure_hash|
  p = Movement.new
  p.name = name
  p.save
end
