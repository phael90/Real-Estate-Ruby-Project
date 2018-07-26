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
  @flat = Flat.find(params['flat_id'])
  if @flat.available_space == 0
    redirect to "/flats/failed"
  else
  @flat.available_space -= 1
  @flat.update()
  @rental = Rental.new(params)
  tenant = Tenant.find(params['tenant_id'])
  tenant.occupier_status = true
  tenant.update()
  @rental.save
  redirect to "/flats"
end
end
