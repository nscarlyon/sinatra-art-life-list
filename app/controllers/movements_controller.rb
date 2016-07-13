class MovementsController < ApplicationController

  get '/movements' do
    if logged_in?
      erb :'movements/index'
    else
      redirect to "/login"
    end
  end

  get '/movements/:slug' do
    @movement = Movement.find_by_slug(params[:slug])
    erb :'movements/show'
  end


end
