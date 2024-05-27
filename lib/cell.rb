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
    if !empty?
      @ship.health -= 1
    end
  end
  
  def fired_upon?
    @fired_upon
  end

  def reveal_ship?
    @reveal_ship
  end

  def render(reveal_ship = false) 
    if !fired_upon? && empty?
      "."
    elsif reveal_ship? && !empty? 
      "S"
    elsif fired_upon? && empty?
      "M"
    elsif fired_upon? && !empty? && !@ship.sunk?
      "H"
    elsif @ship.sunk? 
      "X"
    end
  end
end
