
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

  attr_reader :pendingBadConsequence  #Objeto BadConsequence
  attr_reader :visibleTreasures       #Objeto Treasure
  attr_reader :hiddenTreasures        #Objeto Treasure
 
  #-dead : boolean
  #−name : string
  #−level : int
  
  def initialize(name)
    @dead = true
    @name = name
    @level = 1
    @@MAXHIDDENTREASURES = 4
    @visibleTreasures = Array.new
    @hiddenTreasures = Array.new
    @pendingBadConsequence = BadConsequence.newVacio  
  end
  
  private
  
  #Devuelve a la vida ?
  def bringToLive()
    @dead = false;
  end
  
  #Incrementa el nivel del jugador en i niveles, teniendo 1 <=level <= 10  (CREO)
  def incrementLevels(l)
    if (@level += l) >= 10
      @level = 10
    else
      @level += l
    end
  end
  
  #Decrementa el nivel del jugador en i niveles, teniendo 1 <=level <= 10  (CREO)
  def decrementLevels(l)
    if (@level = @level - l) <= 1
      @level = 1
    else
      @level = @level - l
    end
  end
  
  #Asigna el mal rollo al jugador
  def setPendingBadConsequence(b) #b : BadConsequence
    pendingBadConsequence = b
  end
  
  def die()
    @dead = true;
    @visibleTreasures = new Array
    @HiddenTreasures = new Array
  end
  
  def discardNecklaceIfVisible()
    
  end
  
  def dieIfNoTreasures()
    if @visibleTreasures.empty? && @hiddenTreasures.empty?
      @dead = true
    end
  end
  
  #Devuelve true si con los niveles que compra no gana la partida y false en caso
  #contrario.
  def canIBuyLevels(i) #i int
    l = i / 1000
    if (@level += l) >= 10
      respuesta = false
    else
      respuesta = true
    end
    
    respuesta
  end
  
  protected
  def computeGoldCoinsValue(t) #t : Treasure[]
    
  end
  
  public
  
  def applyPrize(p)   #(p : Prize) : void
    
  end
  
  def combat(m)  #(m : Monster) : CombatResult
    
  end
  
  def applyBadConsequence(bad) #(bad : BadConsequence) : void
    
  end
  
  def makeTreasureVisible(t) # (t: Treasure) : boolean  
   
  end
  
  def canMakeTreasureVisible(t) # (t : Treasure) : boolean
   
  end
  
  def discardVisibleTreasure(t) # (t : Treasure) : void 
    @pendingBadConsequence.specificVisibleTreasures = Array.new
  end
  
  def discardHiddenTreasure(t) # (t : Treasure) : void
      @pendingBadConsequence.specificHiddenTreasures = Array.new
  end
  
  
  def buyLevels(visible , hidden)  #(visible: Treasure [],  hidden : Treasure []) : boolean
    
  end
  
  
  #Devuelve el nivel de combate del jugador, que viene dado por su nivel más los
  #bonus que le proporcionan los tesoros que tenga equipados, según las reglas del
  #juego.
  def getCombatLevel() 
    @level + @visibleTreasures.maxBonus + @hiddenTreasures.maxBonus
  end
  
  
  #Devuelve true cuando el jugador no tiene ningún mal rollo que cumplir y no tiene
  #más de 4 tesoros ocultos y false en caso contrario.
  def validState() 
    if(@pendingBadConsequence.isEmpty() && @hiddenTreasures.size > 4)
      respuesta = true
    else
      respuesta = false
    end
    #: boolean
    
  end
  
  def initTreasures() #: boolean
    
  end
  
  def isDead() 
    @dead
  end
  
  def hasVisibleTreasures()
    @pendingBadConsequence.specificVisibleTreasures.empty?
  end

=begin
este Player es el constructor, que le pasas el nombre, lo he puesto bien arriba que tenias una ?
  def player(name) 
    @name = name;
  end
=end
  
  def getVisibleTreasures()
    #Creo que se refiere a los tesoros visibles del jugador, no los del mal rollo,osea solo:
    #@visibleTreasures
    @pendingBadConsequence.specificVisibleTreasures
  end
  
  def getHiddenTreasures() 
    #Igual
    @pendingBadConsequence.specificHiddenTreasures
  end
end




=begin
  jugador = Player.new
  jugador.getCombatLevel()
  puts jugador.validState()
=end