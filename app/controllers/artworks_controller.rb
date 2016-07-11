class ArtworksController < ApplicationController

  get '/artworks' do
    erb :'/artworks/index'
  end
end
