require('spec_helper')

describe(Venue) do
  it {should have_and_belong_to_many(:bands)}

  it("ensures a location exists") do
    venue = Venue.new({:name => ""})
    expect(venue.save()).to(eq(false))
  end

  it("converts the venue to capitalized and have 'Man!' added") do
    venue = Venue.create({:name => "vienna", :price => 5})
    expect(venue.name()).to(eq("Vienna Man!"))
  end
end
