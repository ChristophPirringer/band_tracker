require('spec_helper')

describe(Venue) do
  it {should have_and_belong_to_many(:bands)}

  it("ensures a location exists") do
    venue = Venue.new({:name => ""})
    expect(venue.save()).to(eq(false))
  end

  it("ensures that the location has the name as entered") do
    venue = Venue.create({:name => "vienna", :price => 5})
    expect(venue.name()).to(eq("vienna"))
  end

  it("ensures that the location has the price as entered") do
    venue = Venue.create({:name => "vienna", :price => 5})
    expect(venue.price()).to(eq(5))
  end
end
