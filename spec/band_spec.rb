require('spec_helper')

describe(Band) do
  it {should have_and_belong_to_many(:venues)}

   it("ensures a name exists") do
    band = Band.new({:name => ""})
    expect(band.save()).to(eq(false))
  end

  it("converts the name to capitalized") do
    band = Band.create({:name => "metallica"})
    expect(band.name()).to(eq("Metallica"))
  end

end
