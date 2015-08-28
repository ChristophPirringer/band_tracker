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
		visit('/bands')
		fill_in('name', :with => 'metallica')
    fill_in('price', :with => 5)
		click_button('Add Band')
		expect(page).to have_content('Metallica')
    end

  it('displays the band along with a statement about their price') do
    visit('/bands')
    fill_in('name', :with => 'metallica')
    fill_in('price', :with => 5)
    click_button('Add Band')
    expect(page).to have_content('Metallica demanding 5 Dollars per ticket.')
	end

  it('will not display the band if the name is "nickelback"') do
    visit('/bands')
    fill_in('name', :with => 'nickelback')
    fill_in('price', :with => 5)
    click_button('Add Band')
    expect(page).to have_no_content('Nickelback demanding 5 Dollars per ticket.')
  end
end

describe('removing bands', {:type => :feature}) do
  it('allows a user to delete a specific band') do
    visit('/bands')
    fill_in('name', :with => 'metallica')
    fill_in('price', :with => 5)
    click_button('Add Band')
    click_link('Delete Metallica')
    expect(page).to have_no_content('Metallica')
  end

  it('allows a user to delete all bands') do
    visit('/bands')
    fill_in('name', :with => 'one metallica')
    fill_in('price', :with => 5)
    click_button('Add Band')
    fill_in('name', :with => 'two metallica')
    fill_in('price', :with => 5)
    click_button('Add Band')
    click_link('Clear all bands')
    expect(page).to have_no_content('Metallica')
  end
end

describe('renaming a band', {:type => :feature}) do
  it('allows a user to add a new band and see it on the bands-page') do
    visit('/bands')
    fill_in('name', :with => 'metallica')
    fill_in('price', :with => 5)
    click_button('Add Band')
    click_link('Metallica demanding 5 Dollars per ticket.')
    fill_in('name', :with => 'plastica')
    click_button('Update')
    expect(page).to have_content('Plastica')
    end
end

describe('adding a venue to a band', {:type => :feature}) do
  it('allows a user to add a new band and see it on the bands-page') do
    visit('/venues')
    fill_in('name', :with => 'berlin')
    fill_in('price', :with => 5)
    click_button('Add Venue')
    visit('/bands')
    fill_in('name', :with => 'metallica')
    fill_in('price', :with => 5)
    click_button('Add Band')
    click_link('Metallica demanding 5 Dollars per ticket.')
    click_button('Submit')
    expect(page).to have_content('Buy A Ticket!')
  end
end

describe('deleting a band', {:type => :feature}) do
  it('allows a user to add a new band and see it on the bands-page') do
    visit('/venues')
    fill_in('name', :with => 'berlin')
    fill_in('price', :with => 5)
    click_button('Add Venue')
    visit('/bands')
    fill_in('name', :with => 'metallica')
    fill_in('price', :with => 5)
    click_button('Add Band')
    click_link('Metallica demanding 5 Dollars per ticket.')
    click_button('Delete Band')
    expect(page).to have_no_content('Metallica')
  end
end


#################################################################
############################---Venue-Path---#####################
#################################################################
describe('adding a new venue', {:type => :feature}) do
  it('allows a user to add a new venue and see it on the venues-page, added with "man" if it is only one word') do
    visit('/venues')
    fill_in('name', :with => 'berlin')
    fill_in('price', :with => 5)
    click_button('Add Venue')
    expect(page).to have_content('Berlin Man!')
    end

  it('does not add " Man!" to the name of the venue if it consists of two words') do
    visit('/venues')
    fill_in('name', :with => 'new york')
    fill_in('price', :with => 5)
    click_button('Add Venue')
    expect(page).to have_content('New York')
  end

  it('displays the band along with a statement about their price') do
    visit('/venues')
    fill_in('name', :with => 'Berlin')
    fill_in('price', :with => 5)
    click_button('Add Venue')
    expect(page).to have_content('Berlin Man! charging 5 Dollars overhead')
  end
end

describe('removing venues', {:type => :feature}) do
  it('allows a user to delete a specific venue') do
    visit('/venues')
    fill_in('name', :with => 'berlin')
    fill_in('price', :with => 5)
    click_button('Add Venue')
    click_link('Delete Berlin Man!')
    expect(page).to have_no_content('Berlin')
  end

  it('allows a user to delete all venues') do
    visit('/venues')
    fill_in('name', :with => 'one berlin')
    fill_in('price', :with => 5)
    click_button('Add Band')
    fill_in('name', :with => 'two berlin')
    fill_in('price', :with => 5)
    click_button('Add Band')
    click_link('Clear all venues!')
    expect(page).to have_no_content('Berlin')
  end
end

describe('adding a new venue', {:type => :feature}) do
  it('allows a user to enter the venue-page and see no bands featured yet') do
    visit('/venues')
    fill_in('name', :with => 'berlin')
    fill_in('price', :with => 5)
    click_button('Add Venue')
    click_link('Berlin Man! charging 5 Dollars overhead')
    expect(page).to have_content('Currently')
  end
end

describe('seeing a band in a venue-entry', {:type => :feature}) do
  it('allows a user to add a new band and see it on the bands-page') do
    visit('/venues')
    fill_in('name', :with => 'berlin')
    fill_in('price', :with => 5)
    click_button('Add Venue')
    visit('/bands')
    fill_in('name', :with => 'metallica')
    fill_in('price', :with => 5)
    click_button('Add Band')
    click_link('Metallica demanding 5 Dollars per ticket')
    click_button('Submit')
    click_link('Berlin Man!')
    expect(page).to have_content('Metallica')
  end
end


#################################################################
###########################---Ticket-Path---#####################
#################################################################
describe('buying a ticket', {:type => :feature}) do
  it('allows a user to add a new venue and see it on the venues-page') do
    visit('/venues')
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
