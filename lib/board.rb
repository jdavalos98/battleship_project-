require 'pry'

class Board
  attr_reader :cells

  def initialize
    @cells = {
              "A1" => Cell.new("A1"),
              "A2" => Cell.new("A2"),
              "A3" => Cell.new("A3"),
              "A4" => Cell.new("A4"),
              "B1" => Cell.new("B1"),
              "B2" => Cell.new("B2"),
              "B3" => Cell.new("B3"),
              "B4" => Cell.new("B4"),
              "C1" => Cell.new("C1"),
              "C2" => Cell.new("C2"),
              "C3" => Cell.new("C3"),
              "C4" => Cell.new("C4"),
              "D1" => Cell.new("D1"),
              "D2" => Cell.new("D2"),
              "D3" => Cell.new("D3"),
              "D4" => Cell.new("D4")
              }
    
    
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, placement)
    return false unless placement.all?{|coordinate| valid_coordinate?(coordinate)}
    return false unless placement.length == ship.health
    return false unless consecutive_coordinates?(placement)
    #checks that the cell is empty before placing ship
  end

  def consecutive_coordinates?(placement)
    row = placement.map {|cell| cell[0]}
    column = placement.map {|cell| cell[1]}

    if row.uniq.length == 1
      consecutive_row = row.each_cons(2).all? {|a, b| b == a.next}
    elsif column.uniq.length == 1
      consecutive_column = column.each_cons(2).all? {|a, b| b == a.next}
    else
      false
    end
  end
  
  # @cells.each_cons(placement.length){|array| p array}
  # row = letter
  # column = number
  # row = placement.map{|cell| cell[0]}
  # column = placement.map{|cell| cell[1]}
  # p row
  # p column

  private 

  def generate_cells
    coordinates = [
      "A1", "A2", "A3", "A4",
      "B1", "B2", "B3", "B4",
      "C1", "C2", "C3", "C4",
      "D1", "D2", "D3", "D4"
      ]


    coordinates.each do |coordinate|
        @cells[coordinate] = Cell.new(coordinate)
    end
  end
end

