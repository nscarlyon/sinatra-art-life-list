require './config/environment'
require 'sinatra/base'
require_relative 'app/controllers/artists_controller'
require_relative 'app/controllers/artworks_controller'
require_relative 'app/controllers/movements_controller'
require_relative 'app/controllers/application_controller'

use Rack::MethodOverride
use MovementsController
use ArtistsController
use ArtworksController
run ApplicationController
