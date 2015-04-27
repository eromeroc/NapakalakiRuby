
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
  
  def to_s
    output = "\nNombre: = #{@name}"+
              +"\nTipo: = #{@type.to_s}"+
              + "\n\tModenas de oro: #{@goldCoins}"+
              + "\n\tBonus Minimo: #{@minBonus} "+
              + "\n\tBonus Maximo: #{@maxBonus} "
    output
  end
end

#puts Treasure.new("Varita de atizamiento", 400, 3, 4, TreasureKind::ONEHAND).to_s
end

