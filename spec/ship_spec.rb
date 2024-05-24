require 'spec_helper'

RSpec.describe Ship do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end
  
  describe "#initialize" do
    it "can initialize a cruiser" do
      expect(@cruiser.type).to eq("Cruiser")
      expect(@cruiser.health).to eq(3)
    end
    it "can initialize a submarine" do
      expect(@submarine.type).to eq("Submarine")
      expect(@submarine.health).to eq(2)
    end
  end

  describe "can take damage & be sunk" do
    it "can take damage" do
      @cruiser.hit
      expect(@cruiser.health).to eq(2)

      @submarine.hit
      expect(@submarine.health).to eq(1)
    end

    it "can be sunk" do
      @cruiser.hit
      expect(@cruiser.sunk?).to be false
      expect(@cruiser.health).to eq(2)
      @cruiser.hit
      expect(@cruiser.sunk?).to be false
      expect(@cruiser.health).to eq(1)
      @cruiser.hit
      expect(@cruiser.sunk?).to be true
      expect(@cruiser.health).to eq(0)

      @submarine.hit
      expect(@submarine.sunk?).to be false
      expect(@submarine.health).to eq(1)
      @submarine.hit
      expect(@submarine.sunk?).to be true
      expect(@submarine.health).to eq(0)
    end
  end
end