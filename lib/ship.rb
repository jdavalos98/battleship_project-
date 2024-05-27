class Ship
  attr_reader :type

  attr_accessor :health

  def initialize(type, health)
    @type = type
    # @length = length
    @health = health
  end

  def hit
    @health -= 1
  end

  def sunk?
    if @health == 0
      true
    else
      false
    end
  end
end
