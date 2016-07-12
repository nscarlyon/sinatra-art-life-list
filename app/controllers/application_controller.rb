require 'pry'
require './config/environment'
require "./app/models/user"

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end

  get '/artworks' do
    erb :'/artworks/index'
  end

  get '/signup' do
    erb :'users/create_user'
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
