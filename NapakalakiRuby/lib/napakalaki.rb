
require 'singleton'


class Napakalaki
  include Singleton
  #Ni getInstance ni nada?
  
  attr_reader :currentMonster   #Objeto Monster
  attr_reader :currentPlayer    #Objeto Player
  attr_reader :players          #Array de players ¿A partir de 1?

  
  def initialize
    
  end
  
  private
  def initPlayers(names) # (names : string[]) : void
    
  end
  
  def nextPlayer() # : Player
    
  end
  
  public
  def combat() # : CombatResult
    
  end 
  
  def discardVisibleTreasure(t) # (t : Treasure) : void
  
  end
  
  def discardHiddenTreasure(t) # (t : Treasure) : void
    
  end
  
  def makeTreasureVisible(t) # (t : Treasure) : boolean
    
  end
  
  def buyLevels(visible, hidden) # (visible : Treasure[], hidden : Treasure[]) :boolean
    
  end
  
  def initGame(players)  #(players : String[]) : void
    
  end
  
  def getCurrentPlayer()  # : Player
    
  end
  
  def getCurrentMonster() # : Monster
    
  end
  
  def canMakeTreasureVisible(t) # (t: Treasure) : boolean
    
  end
  
  def getVisibleTreasures() # : Treasure[]
  
  end
  
  def getHiddenTreasures() # : Treasure[]
  
  end
  
  def nextTurn()  # : boolean
    
  end
  
  def nextTurnAllowed() # : boolean
    
  end
  
  def endOfGame(result) # (result : CombatResult) : boolean
    
  end
  
end
