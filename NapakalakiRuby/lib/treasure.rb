
require_relative 'treasure_kind'

module Model
class Treasure
  
  attr_reader :name
  attr_reader :goldCoins
  attr_reader :minBonus
  attr_reader :maxBonus
  attr_reader :type
  
  def initialize(n, g, min, max, t)
    @name = n
    @goldCoins = g
    @minBonus = min
    @maxBonus = max
    @type = t
  end
  
end
end
