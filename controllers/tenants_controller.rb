require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tenant.rb' )
also_reload('./models/*')

#index
get '/tenants' do
  @tenants = Tenant.all()
  erb(:"tenants/index")
end

#create
post '/tenants' do
  @tenant = Tenant.new(params)
  @tenant.save()
  erb(:"tenants/create")
end

#new
get '/tenants/new' do
  erb(:"tenants/new")
end

#
get '/tenants/login' do
  erb(:"tenants/login")
end

#edit
get '/tenants/:id/edit' do
  @tenant = Tenant.find(params['id'])
  erb(:"tenants/edit")
end

#update
post '/tenants/:id' do
  @tenant = Tenant.new(params)
  @tenant.update()
  redirect to "tenants/#{params['id']}"
end

#show
get '/tenants/:id' do
  @tenant = Tenant.find(params['id'].to_i)
  erb(:"tenants/show")
end

#
