class MovementsController < ApplicationController

  get '/movements' do
    erb :'movements/index'
  end
end
