class Cell
  attr_reader :coordinate, :ship, :place_ship

  def initialize(coordinate, fired_upon = false, reveal_ship = false)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = fired_upon
    @reveal_ship = reveal_ship
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    if empty? 
      @ship = ship
    else
      "Space Occupied"
    end
  end

  def fire_upon
    @fired_upon = true
    @ship.hit unless empty?
  end
  
  def fired_upon?
    @fired_upon
  end

  def reveal_ship?
    @reveal_ship
  end

  def render(reveal_ship = false) 
    if !fired_upon? && empty?
      puts "Rendering: ."
      "."
    elsif fired_upon? && empty?
      puts "Rendering: M"
      "M"
    elsif fired_upon? && !empty? && !@ship.sunk?
      puts "Rendering: H"
      "H"
    elsif reveal_ship && !empty? 
      puts "Rendering: S"
      "S"
    elsif @ship.sunk?
      puts "Rendering: X"
      "X"
    else
      nil
    end
  end
end
