require 'pry'
require './config/environment'
require "./app/models/user"
require 'rack-flash'

class ApplicationController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "artlifelist"
  end

  get '/' do
    erb :index
  end

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
    artwork = Artwork.new(name: params["name"], medium: params["medium"])
    artwork.artist = Artist.find_or_create_by(name: params["artist"])
    artwork.movements << Movement.create(name: params["movement"])
    current_user.artworks << artwork
    current_user.save
     flash[:message] = "Successfully added artwork."
    redirect to "/artworks"
  end

  get '/signup' do
    if logged_in?
      redirect to "/artworks"
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    user = User.new(username: params[:username], password: params[:password])

    if user.username != "" && user.password != "" && user.save
      session[:user_id] = user.id
      redirect to "/artworks"
    else
      flash[:message] = "You did not enter a valid username and/or password. Please try again."
      redirect to "/signup"
    end
  end

  get '/login' do
    if logged_in?
      redirect to "/artworks"
    else
      erb :'users/login'
    end
  end

  post '/login' do
    user = User.find_by(username: params["username"])
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      redirect to "/artworks"
    else
      flash[:message] = "You did not enter a valid username and/or password. Please try again."
      redirect to "/login"
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to "/login"
    else
      redirect to "/"
    end
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


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end


end
