require 'pry'

class Board
  attr_reader :cells
  
  def initialize
    @cells = {  "A1" => Cell.new("A1"),
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
                "D4" => Cell.new("D4") }
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, placement)
    return false unless placement.all?{|coordinate| valid_coordinate?(coordinate)}
    return false unless placement.length == ship.health
    return false unless consecutive_coordinates?(placement)
    return false if overlapping?(placement)
    true
  end

  def consecutive_coordinates?(placement)
    row = placement.map {|cell| cell[0]}
    column = placement.map {|cell| cell[1]}
    if row.uniq.length == 1
      column.each_cons(2).all? {|a, b| b == a.next}
    elsif column.uniq.length == 1
      row.each_cons(2).all? {|a, b| b == a.next}
    else
      false
    end
  end

  def overlapping?(coordinates)
    coordinates.any? {|x| !@cells[x].empty?}
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each { |x| @cells[x].place_ship(ship)}
    end
  end

  def render_board(reveal_ship = false)
    "  1 2 3 4 \n" +
    "A" + " " + @cells["A1"].render(reveal_ship) + " " + @cells["A2"].render(reveal_ship) + " " + @cells["A3"].render(reveal_ship)+ " " + @cells["A4"].render(reveal_ship) + " " + "\n" +
    "B" + " " + @cells["B1"].render(reveal_ship) + " " + @cells["B2"].render(reveal_ship) + " " + @cells["B3"].render(reveal_ship)+ " " + @cells["B4"].render(reveal_ship) + " " + "\n" +
    "C" + " " + @cells["C1"].render(reveal_ship) + " " + @cells["C2"].render(reveal_ship) + " " + @cells["C3"].render(reveal_ship)+ " " + @cells["C4"].render(reveal_ship) + " " + "\n" +
    "D" + " " + @cells["D1"].render(reveal_ship) + " " + @cells["D2"].render(reveal_ship) + " " + @cells["D3"].render(reveal_ship)+ " " + @cells["D4"].render(reveal_ship) + " " + "\n" 
    # @cells.each {|cell| cell.render(reveal_ship)}
    
  end
end

