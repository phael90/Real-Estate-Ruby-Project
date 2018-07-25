require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/flat.rb' )
also_reload('./models/*')

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

#edit
get '/flats/:id/edit' do
  @animal_friendly = ["Yes", "No"]
  @smokers_friendly = ["Yes", "No"]
  @flat = Flat.find(params['id'])
  @flat.update
  erb(:"flats/edit")
end

#update
post '/flats/:id' do
  @flat = Flat.new(params)
  @flat.update()
  redirect to "flats/#{params['id']}"
end

#show
get '/flats/:id' do
  @flats = Flat.find(params['id'].to_i)
  erb(:"flats/show")
end

# destroy
post '/flats/:id/delete' do
  flat = Flat.new(params)
  flat.delete()
  redirect to '/'
    #where to direct after delete???
end
