class ArtistsController < ApplicationController

  get '/artists' do
    if logged_in?
      erb :'artists/index'
    else
      redirect to "/login"
    end
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end

end
