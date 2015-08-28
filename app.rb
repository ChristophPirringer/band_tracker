require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end


#############################
######---Bands-Page---#######
#############################
get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

post("/bands") do
  name = params.fetch("name")
  Band.create({:name => name})
  redirect("/bands")
end

get('/bands/:id/delete_from_bands') do
	@band = Band.find(params['id'].to_i)
	@band.destroy
	@bands = Band.all()
	erb(:bands)
end


##########################
#####___Clear-Bands___####
##########################
get("/clear/bands") do
	Band.delete_all()
  @bands = Band.all()
	erb(:bands)
end


#############################
######---Venues-Page---######
#############################
get('/venues') do
  @venues = Venue.all()
  erb(:venues)
end

post("/venues") do
  name = params.fetch("name")
  Venue.create({:name => name})
  redirect("/venues")
end

get('/venues/:id/delete_from_venues') do
  @venue = Venue.find(params['id'].to_i)
  @venue.destroy
  @venues = Venue.all()
  erb(:venues)
end


##########################
#####___Clear-Venues___###
##########################
get("/clear/venues") do
  Venue.delete_all()
  @venues = Venue.all()
  erb(:venues)
end
