require 'pry'

class Board
  attr_reader :cells

  def initialize
    @cells = {}
    generate_cells
    # @row = row
    # @column = column
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, placement)
    return false unless placement.all?{|coordinate| valid_coordinate?(coordinate)}
    return false unless placement.length == ship.health
    return false unless consecutive_coordinates?(placement)
  end

  def consecutive_coordinates?(placement)

    # .each_cons(placement.length){|array| p array}
    # row = letter
    # column = number
    # row = placement.map{|cell| cell[0]}
    # column = placement.map{|cell| cell[1]}
    # p row
    # p column
  end

  def row(coordinate)
    coordinate.to_a.map {|coord| coord[0]}
  end
  binding.pry
  
  def column(coordinate)
    coordinate.to_i.map{|coord| coord[1]}
  
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

