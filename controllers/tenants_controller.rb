require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tenant.rb' )

get '/tenants' do
  @tenants = Tenant.all
  erb(:"tenants/index")
end

get '/tenants' do
  @tenants = Tenant.find(params['id'].to_i)
  erb(:"tenants/show")
end
