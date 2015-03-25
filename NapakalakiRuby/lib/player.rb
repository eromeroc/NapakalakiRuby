# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'bad_consequence'
require_relative 'treasure'
require_relative 'card_dealer'

class Player
=begin
  Discontinuas con:


  CardDealer
  CombatResult
  Dice
=end
  


  attr_reader :pendingBadConsequence  #Objeto de BC
  attr_reader :visibleTreasures       #Objeto de Treasure
  attr_reader :hiddenTreasures       #Objeto de Treasure
 
  #−name : string
  #−level : int
  
  def initialize
    @dead = true
    @MAXHIDDENTREASURES = 4
    @visibleTreasures = Array.new
    @hiddenTreasures = Array.new
    
    # ?
    @name = "Sin nombre"
    @level = 0 
  end
  
  def bringToLive()
    @dead = false;
  end
  
  def incrementLevels(l)
    @level += l
  end
  
  def decrementLevels(l)
    @level = @level - l
  end
  
  def setPendingBadConsequence( b) #b -> BadConsequence
    pendingBadConsequence = b
  end
  
  def die()
    @dead = true;
  end
  
  def discardNecklaceIfVisible()
    # ??
  end
  
  def dieIfNoTreasures()
    if @visibleTreasures.empty? && @hiddenTreasures.empty?
      @dead = true
    end
  end
  
  def canIBuyLevels(l)
    
  end
  
  #Hasta aquí se supone que son privados, como lo pongo?
  
  def applyPrize(p)   #p -> Prize   return void
    #?
  end
  
  def combat(m)  #m->Monster ; return CombatLevel
    #?
  end
  
  def applyBadConsequence(bad ) # bad-> : BadConsequence
    #void
  end
  
  def makeTreasureVisible(t) # t: Treasure)  
    # return boolean
  end
  
  def canMakeTreasureVisible(t) # t : Treasure) 
    #return: boolean
  end
  
  def discardVisibleTreasure(t)# t : Treasure) 
    @pendingBadConsequence.specificVisibleTreasures = Array.new
  end
  
  def discardHiddenTreasure(t) # t : Treasure) 
      @pendingBadConsequence.specificHiddenTreasures = Array.new
  end
  
  def buyLevels(visible , hidden)  #visible: Treasure []      hidden  : Treasure []
    #: boolean
  end
  
  def getCombatLevel() 
    #?
    @level
  end
  
  def validState() 
    #: boolean
  end
  
  def initTreasures() 
    #: boolean
  end
  
  def isDead() 
    @dead
  end
  
  def hasVisibleTreasures()
    @pendingBadConsequence.specificVisibleTreasures.empty?
  end
  
  def player(name) #Player(name : string)
    @name = name;
  end
  
  def getVisibleTreasures() 
    @pendingBadConsequence.specificVisibleTreasures
  end
  
  def getHiddenTreasures() 
    @pendingBadConsequence.specificHiddenTreasures
  end
end
