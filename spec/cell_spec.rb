require 'spec_helper'

RSpec.describe Cell do
  before(:each) do
    @cell1 = Cell.new("B4")
    @cell2 = Cell.new("C3")
    @ship = Ship.new(@type, @health)
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

    @cell1.fire_upon
    expect(@cruiser.health).to eq(2)
    expect(@cell1.fired_upon?).to be true
  end
  
  describe "can render cells" do
    it "can render an empty cell" do
      expect(@cell1.render).to eq(".")
    end

    it "can render a missed shot" do
      @cell1.fire_upon
      expect(@cell1.render).to eq("M")
    end

    it "can reveal a ship" do
      expect(@cell2.render).to eq(".")
      @cell2.place_ship(@cruiser)
      expect(@cell2.render(true)).to eq("S")
    end

    it "can render a succesful shot" do
      @cell2.place_ship(@cruiser)
      @cell2.fire_upon
      expect(@cell2.render(true)).to eq("H")
      expect(@cruiser.sunk?).to be false
    end
    it "can render a sunken ship" do
      @cell2.place_ship(@cruiser)
      @cell2.fire_upon
      @cruiser.hit
      @cruiser.hit
      expect(@cruiser.sunk?).to be true
      expect(@cell2.render).to eq("X")
    end
  end
end