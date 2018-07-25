require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/rental.rb' )
require_relative( '../models/flat.rb' )
require_relative( '../models/tenant.rb' )


# get '/flats_matches'  do
#   @flat = Flat.
#   @tenant = Tenant
#   erb ( :"flats_matches/index" )
# end

# destroy
# post '/flat_matches/:id/delete' do
#   flat_match = FlatMatch.new(params)
#   tenant.delete()
#   redirect to '/flats_matches'
#   #where to direct after delete???
# end
