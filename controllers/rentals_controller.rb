require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/flat.rb' )
require_relative( '../models/tenant.rb' )
also_reload('./models/*')

#index
get '/rentals' do
  @rentals = Rental.all()
  erb(:"rentals/index")
end

#new
get '/rentals/new' do
  @tenants = Tenant.all()
  @flats = Flat.all()
  @rental = Rental.new(params)

  erb(:"rentals/new")
end

post '/rentals' do
  @rental = Rental.new(params)
  @rental.save
  erb :"rentals/show"
end
