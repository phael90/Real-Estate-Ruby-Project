require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( './controllers/flats_controller.rb' )
require_relative( './controllers/flats_matches_controller.rb' )
require_relative( './controllers/tenants_controller.rb' )
require_relative( './controllers/rentals_controller.rb' )

get '/' do
  erb( :index )
end
