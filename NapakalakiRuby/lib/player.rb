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
    @@MAXHIDDENTREASURES = 4
    @visibleTreasures = Array.new
    @hiddenTreasures = Array.new
    @pendingBadConsequence = BadConsequence.newVacio
    
    # ?
    @name = "Sin nombre"
    @level = 0 
  end
  
  
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
  
  def setPendingBadConsequence( b) #b -> BadConsequence
    pendingBadConsequence = b
  end
  
  def die()
    @dead = true;
    @visibleTreasures = new Array
    @HiddenTreasures = new Array
  end
  
  def discardNecklaceIfVisible()
    # ??
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
    #Devuelve true si con los niveles que compra no gana la partida y false en caso
#contrario.
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
    
    #Devuelve true cuando el jugador no tiene ningún mal rollo que cumplir y no tiene
#más de 4 tesoros ocultos y false en caso contrario.
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

=begin
  jugador = Player.new
  jugador.getCombatLevel()
  puts jugador.validState()
=end