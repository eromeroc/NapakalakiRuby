
require_relative 'treasure_kind'
require_relative 'card'

module Model
class Treasure
  
  include Card
  
  attr_reader :name
  attr_reader :goldCoins
  attr_reader :minBonus
  attr_reader :maxBonus
  attr_reader :type
  attr_reader :levelChangeAgainstCultistPlayer
  
  def initialize(n, g, min, max, t, levelCultist)
    @name = n
    @goldCoins = g
    @minBonus = min
    @maxBonus = max
    @type = t
    @levelChangeAgainstCultistPlayer = levelCultist
  end
  
  def to_s
    "\nNombre: = "+ @name +
              "\n\tTipo: " + @type.to_s +
              "\n\tModenas de oro: " + @goldCoins.to_s +
              "\n\tBonus Minimo: " + @minBonus.to_s +
              "\n\tBonus Maximo: " + @maxBonus.to_s
  end
end

def getBasicValue
  @minBonus
end
  
def getSpecialValue
  @maxBonus  
end

#puts Treasure.new("Varita de atizamiento", 400, 3, 4, TreasureKind::ONEHAND).to_s
end

