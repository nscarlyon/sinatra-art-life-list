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
    erb :'artworks/index'
  end

  get '/signup' do
    if logged_in?
      redirect to "/artworks"
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    user = User.create(username: params[:username], password: params[:password])
    
    if user.username != "" && user.password != "" && user.save
      session[:user_id] = user.id
      redirect to "/artworks"
    else
      flash[:message] = "You did not enter a valid username and/or password. Please try again."
      redirect to "/signup"
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
