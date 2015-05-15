
require_relative 'card'
require_relative 'cultist_card'

module Model
class CultistPlayer < Player
  
  attr_reader :totalCultistPlayers
  attr_reader :myCultistCard
  #player no es una variable no??? como llamo a getCombatLevel???
  @@totalCultistPlayers = 0
  
  def initialize(p, c)
    super.copyPlayer(p)
    @myCultistCard = c
    @@totalCultistPlayers += 1
  end
  
  def getCombatLevel
    super + @myCultistCard.getSpecialValue
        
  end
  
  protected
  
  def shouldConvert
    false
  end
  
  def getOponentLevel(m)
    m.getSpecialValue
  end
  
  def computeGoldCoinsValue(t)
    goldCoinsValue = 0
    t.each do|k| 
      goldCoinsValue += k.goldCoins *2
    end
    niveles = goldCoinsValue / 1000 
    niveles
    
  end
  
  public
  def self.getTotalCultistPlayers
    @@totalCultistPlayers
  end
end
end

