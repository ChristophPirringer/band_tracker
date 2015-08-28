require('spec_helper')

describe(Venue) do
  it {should have_and_belong_to_many(:bands)}

  it("ensures a location exists") do
    venue = Venue.new({:name => ""})
    expect(venue.save()).to(eq(false))
  end

  it("converts the venue to capitalized") do
    venue = Venue.create({:name => "vienna"})
    expect(venue.name()).to(eq("Vienna"))
  end
end
