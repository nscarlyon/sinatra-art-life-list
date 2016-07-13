class ArtworksController < ApplicationController

  get '/artworks' do
    if logged_in?
      @user = current_user
      erb :'users/artworks'
    else
      redirect to "/login"
    end
  end

  get '/artworks/new' do
    if logged_in?
      erb :'artworks/new'
    else
      redirect to "/login"
    end
  end

  post '/artworks' do
    if params["name"] != "" && params["artist"] != ""
      if params["movement"] != "" || !params["movements"].empty?
        artwork = Artwork.new(name: params["name"], medium: params["medium"])
        artwork.artist = Artist.find_or_create_by(name: params["artist"])
        artwork.movement_ids = params["movements"]
          if params["movement"] != ""
            artwork.movements << Movement.find_or_create_by(name: params["movement"])
          end
      else
        flash[:message] = "You did not enter a valid artwork movement. Please try again."
        redirect to "/artworks/new"
      end
    else
      flash[:message] = "You did not enter a valid artwork name and/or artist name. Please try again."
      redirect to "/artworks/new"
    end

    current_user.artworks << artwork
    current_user.save
     flash[:message] = "Successfully added artwork."
     redirect to "/artworks"
  end


    get '/artworks/:id' do
      if logged_in?
        @artwork = Artwork.find_by(id: params[:id])
        erb :'artworks/show'
      else
        redirect to '/login'
      end
    end

    get '/artworks/:id/edit' do
      if logged_in?
        @artwork = Artwork.find_by(id: params[:id])
        erb :'artworks/edit'
      else
        redirect to '/login'
      end
    end

    patch '/artworks/:id' do
      @artwork = Artwork.find_by(id: params[:id])
      @artwork.name = params["name"]
      @artwork.medium = params["medium"]
      @artwork.movement_ids = params["movements"]
      @artwork.artist = Artist.find_or_create_by(name: params["artist"])

      if !params["movement"].empty?
        @artwork.movements << Movement.find_or_create_by(name: params["movement"])
      end

      @artwork.save
        redirect to "/artworks/#{@artwork.id}"
    end

    delete '/artworks/:id' do
      artwork = Artwork.find_by_id(params[:id])
      if logged_in? && artwork.user_id == current_user.id
        artwork.delete
        redirect to "/artworks"
      else
        redirect to '/login'
      end
    end


end
