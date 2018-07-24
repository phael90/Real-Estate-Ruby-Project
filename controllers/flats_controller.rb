require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/flat.rb' )

#index
get '/flats' do
  @flats = Flat.all()
  erb ( :"flats/index")
end

#create
post '/flats' do
  @flat = Flat.new(params)
  @flat.save()
  erb(:"flats/create")
end

#new
get '/flats/new' do
  erb(:"flats/new")
end

#show
get '/flats/:id' do
  @flats = Flat.find(params['id'].to_i)
  erb(:"flats/show")
end
