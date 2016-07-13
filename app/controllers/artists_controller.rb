class ArtistsController < ApplicationController

  get '/artists' do
    if logged_in?
      erb :'artists/index'
    else
      redirect to "/login"
    end
  end

end
