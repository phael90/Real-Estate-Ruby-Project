require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tenant.rb' )

#index
get '/tenants' do
  @tenants = Tenant.all
  erb(:"tenants/index")
end

#create
post '/tenants' do
  @tenant = Tenant.new(params)
  @tenant.save()
  erb :"tenants/create"
end

#new
get '/tenants/new' do
  erb(:"tenants/new")
end

#show
get '/tenants/:id' do
  @tenant = Tenant.find(params['id'].to_i)
  erb(:"tenants/show")
end

#
# get '/tenants/login' do
#   erb(:"tenants/login")
# end
