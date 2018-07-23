require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/flat.rb' )

get '/flats' do
@flats = Flat.all()
erb ( :"flats/index")
end


get '/flats/:id' do
@flats = Flat.find(params['id'].to_i)
erb(:"flats/show")
end
