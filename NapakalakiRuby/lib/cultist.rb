
require_relative 'cultist_player'

class Cultist
  include Card
  
  attr_reader :name
  attr_reader :gainedLevels
  
  def initialize(n, g)
    @name = n
    @gaindeLevels = g 
  end
  
  def getBasicValue
      @gainedLevels
  end
  
  def getSpecialValue
    specialValue = getBasicValue() * CultistPlayer.getTotalCultistPlayers()
      
    specialValue
  end
end
