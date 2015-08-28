require('capybara/rspec')
require('./app')
require("spec_helper")

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


#################################################################
#############################---Band-Path---#####################
#################################################################
describe('adding a new band', {:type => :feature}) do
	it('allows a user to add a new band and see it on the bands-page') do
		visit('/')
		click_link('Bands')
		fill_in('name', :with => 'metallica')
    fill_in('price', :with => 5)
		click_button('Add Band')
		expect(page).to have_content('Metallica')
    end

  it('displays the band along with a statement about their price') do
    visit('/')
    click_link('Bands')
    fill_in('name', :with => 'metallica')
    fill_in('price', :with => 5)
    click_button('Add Band')
    expect(page).to have_content('Metallica demanding 5 Dollars per ticket.')
	end
end


#################################################################
############################---Venue-Path---#####################
#################################################################
describe('adding a new venue', {:type => :feature}) do
  it('allows a user to add a new venue and see it on the venues-page') do
    visit('/')
    click_link('Venues')
    fill_in('name', :with => 'berlin')
    fill_in('price', :with => 5)
    click_button('Add Venue')
    expect(page).to have_content('Berlin Man!')
    end

  it('displays the band along with a statement about their price') do
    visit('/')
    click_link('Venues')
    fill_in('name', :with => 'Berlin')
    fill_in('price', :with => 5)
    click_button('Add Venue')
    expect(page).to have_content('Berlin Man! charging 5 Dollars overhead')
  end
end


#################################################################
###########################---Ticket-Path---#####################
#################################################################
describe('buying a ticket', {:type => :feature}) do
  it('allows a user to add a new venue and see it on the venues-page') do
    visit('/')
    click_link('Venues')
    fill_in('name', :with => 'berlin')
    fill_in('price', :with => 5)
    click_button('Add Venue')
    click_link('Bands')
    fill_in('name', :with => 'metallica')
    fill_in('price', :with => 5)
    click_button('Add Band')
    click_link('Metallica demanding 5 Dollars per ticket.')
    click_button('Submit')
    click_link('Buy A Ticket!')
    click_link("Rock'N'Roll!")
    expect(page).to have_content('Party')
    end
end
