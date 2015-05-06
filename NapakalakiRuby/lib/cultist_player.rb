
require_relative 'card'
require_relative 'cultist_card'

module Model
class CultistPlayer < Player
  
  attr_reader :totalCultistPlayers
  attr_reader :myCultistCard
  #player no es una variable no??? como llamo a getCombatLevel???
  @@totalCultistPlayers = 0
  
  def initialize(p, c)
    copyPlayer(p)
    @myCultistCard = c
    @@totalCultistPlayers += 1
  end
  
  def getCombatLevel
    getCombatLevel + @myCultistCard.getSpecialValue
        
  end
  
  protected
  
  def shouldConvert
    false
  end
  
  def getOponentLevel(m)
    
  end
  
  def computeGoldCoinsValue(t)
    
  end
  
  public
  def self.getTotalCultistPlayers
    @@totalCultistPlayers
  end
end
end

