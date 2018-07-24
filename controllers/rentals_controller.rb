require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/flat.rb' )
require_relative( '../models/tenant.rb' )
also_reload('./models/*')

#index
get '/rentals' do
  erb :"rentals/index"
end
