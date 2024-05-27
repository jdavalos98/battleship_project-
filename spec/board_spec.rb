require 'spec_helper.rb'


RSpec.describe Board do
    before(:each) do
        @board = Board.new
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
end