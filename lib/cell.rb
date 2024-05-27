class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
   
  end

  def empty?
    if ship == nil
      true
    else
      false
    end
  end
  
  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    false
  end

  def fired_upon
    @fired_upon = true
      fired_upon? 
  end
end 

