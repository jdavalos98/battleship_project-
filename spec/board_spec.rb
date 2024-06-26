require 'spec_helper.rb'


RSpec.describe Board do
  before(:each) do
      @board = Board.new
      @cruiser = Ship.new("Cruiser", 3)
      @submarine = Ship.new("Submarine", 2)
  end

  it "exists" do 
      expect(@board).to be_a(Board)
  end

  it "has 16 cells" do
      expect(@board.cells).to be_a(Hash)
      expect(@board.cells.size).to eq(16)
  end

  it "has cells that are instances of Cell" do
      @board.cells.each do |coordinate, cell|
          expect(cell).to be_a(Cell)
      end
  end

  it "has the correct coordinates for cells" do 
      expected_coordinates = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
      expect(@board.cells.keys).to match_array(expected_coordinates)
  end
    
  it "can validate coordinates" do
      expect(@board.valid_coordinate?("A1")).to be true
      expect(@board.valid_coordinate?("D4")).to be true
      expect(@board.valid_coordinate?("A5")).to be false
      expect(@board.valid_coordinate?("E1")).to be false
      expect(@board.valid_coordinate?("A22")).to be false
  end
    
  describe "validates ship placement" do
    it "confirms length and coordinates are equal" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to be false
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to be false
    end
    it "confirms coordinates are consecutive" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to be false
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to be false
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to be false
      expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to be false
    end
    it "confirms coordinates aren't diagonal" do
      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to be false
      expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to be false
    end
    it "confirms valid ship placement" do
      expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to be true
      expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to be true
    end
    it "does not allow overlapping ships" do
        @board.place(@cruiser,["A1", "A2", "A3"])
        expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to be false
    end
  end
  
  describe "rendering the game board" do
    it "can render an empty game board" do
      expect(@board.render_board).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    end

    it "can render a board with hidden ship" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.render_board).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    end

    it "can reveal hidden ships" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.render_board(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end
  end
  
end