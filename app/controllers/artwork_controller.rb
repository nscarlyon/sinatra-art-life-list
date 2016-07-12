class ArtworkController < ApplicationController

  get "/artworks" do
    erb :"artworks/index"
  end

end
