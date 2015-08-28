require('spec_helper')

describe(Band) do
  it {should have_and_belong_to_many(:venues)}

   it("ensures a name exists") do
    band = Band.new({:name => ""})
    expect(band.save()).to(eq(false))
  end

  it("ensures the Band has a name as entered") do
    band = Band.create({:name => "metallica", :price => 5})
    expect(band.name()).to(eq("metallica"))
  end

  it("ensures the Band has a price as entered") do
    band = Band.create({:name => "metallica", :price => 5})
    expect(band.price()).to(eq(5))
  end

end
