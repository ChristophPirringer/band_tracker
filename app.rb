require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end


#################################################################
#############################---Listings---######################
#################################################################


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


#################################################################
#############################---Singulars---#####################
#################################################################


#############################
#######---Band-Page---#######
#############################
get('/bands/:id') do
  @band = Band.find(params.fetch("id").to_i())
  if @band.venues
    @venue = @band.venues
  else
    @venue = nil
  end
  @venues = Venue.all()
  erb(:band)
end

patch("/bands/:id") do
  venue_id = params.fetch("venue_id").to_i()
  venue = Venue.find(venue_id)
  @band = Band.find(params.fetch("id").to_i())
  @band.venues.push(venue)
  redirect back
end

delete('/bands/:id/delete') do
	@band = Band.find(params['id'].to_i)
	@band.destroy
	@bands = Band.all()
	erb(:bands)
end

patch ('/bands/:id/rename') do
	@band = Band.find(params['id'].to_i)
  @band.update({name: params["name"]})
	@bands = Band.all()
	redirect back
end


#############################
#######---Venue-Page---#######
#############################
get('/venues/:id') do
  @venue = Venue.find(params.fetch("id").to_i())
  # binding.pry
  if @venue.bands
    @band = @venue.bands
  else
    @band = nil
  end
  @bands = Band.all()
  erb(:venue)
end
