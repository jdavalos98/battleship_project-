require "spec_helper.rb"

class Board
  attr_reader :cells

  def initialize
    @cells = {}
    generate_cells
  end

  def valid_coordinate?(coordinate)
    @cells.key?(coordinate)
  end

  private 

  def generate_cells
    coordinates = ["A1", "A2", "A3", "A4",
    "B1", "B2", "B3", "B4",
    "C1", "C2", "C3", "C4",
    "D1", "D2", "D3", "D4"]


    coordinates.each do |coordinate|
        @cells[coordinate] = Cell.new(coordinate)
    end
  end
end
