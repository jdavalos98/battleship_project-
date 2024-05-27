require 'spec_helper'



RSpec.describe Cell do
  before(:each) do
    @cell1 = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  it "can initialize" do
    expect(@cell1.coordinate).to eq("B4")
    expect(@cell1.ship).to eq(nil)
    expect(@cell1.empty?).to be true
  end
  it "can place a ship" do
    @cell1.place_ship(@cruiser)
    expect(@cell1.ship).to eq(@cruiser)
    expect(@cell1.empty?).to be false
  end

  it "can be fired upon" do
    @cell1.place_ship(@cruiser)
    expect(@cell1.fired_upon?).to be false

    binding.pry

    @cell1.fired_upon
    # expect(@cruiser.health).to eq(2)
    expect(@cell1.fired_upon?).to be true
  end
end