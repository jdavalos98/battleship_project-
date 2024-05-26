class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate, fired_upon = false)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = fired_upon
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    if empty? == true  
      @ship = ship
      empty? == false
    end
  end

  def fire_upon
    @ship.health -= 1
    @fired_upon = true
  end
  
  def fired_upon?
    @fired_upon
  end
end