require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tenant.rb' )

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



# # edit
# get '/students/:id/edit' do
#   @houses = House.all()
#   @student = Student.find(params['id'])
#   erb( :edit)
# end
#
# # update
# post '/students/:id' do
#   student = Student.new( params )
#   student.update()
#   redirect to "students/" + params['id']
# end

#show
get '/tenants/:id' do
  @tenant = Tenant.find(params['id'].to_i)
  erb(:"tenants/show")
end

#
