# coding: utf-8 
require_relative 'bad_consequence'
require_relative 'treasure'
require_relative 'card_dealer'

class Player

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
  
  #Devuelve a la vida al jugador
  def bringToLive()
    @dead = false;
  end
  
  
  #Incrementa el nivel del jugador en i niveles
  #1 <=level <= 10 
  def incrementLevels(l)
    if (@level += l) >= 10
      @level = 10
    else
      @level += l
    end
  end
  
  
  #Decrementa el nivel del jugador en i niveles
  #1 <=level <= 10  
  def decrementLevels(l)
    if (@level -= l) <= 1
      @level = 1
    else
      @level -= l
    end
  end
  
  
  #Asigna el mal rollo al jugador
  def setPendingBadConsequence(b) #b : BadConsequence
    pendingBadConsequence = b
  end
  
  
  #Cambia el estado del jugador a muerto, quitándole todos los tesoros y volviendo al nivel 1
  def die()
    @dead = true
    @level = 1
    @visibleTreasures = new Array
    @HiddenTreasures = new Array
  end
  
  
  def discardNecklaceIfVisible()
    
  end
  
  
  #Cambia el estado del jugador a muerto si no tiene tesoros visibles ni ocultos
  def dieIfNoTreasures()
    if @visibleTreasures.empty? && @hiddenTreasures.empty?
      @dead = true
    end
  end
  
  
  #Devuelve true si con los niveles que compra no gana la partida y false en caso
  #contrario.
  def canIBuyLevels(i)      #(i : int) : boolean
    l = i / 1000
    if (@level += l) >= 10
      respuesta = false
    else
      respuesta = true
    end
    
    respuesta
  end
  
  
  protected
  def computeGoldCoinsValue(t) #(t : Treasure[]) : float
    
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
    
  end
  
  def discardHiddenTreasure(t) # (t : Treasure) : void
      
  end
  
  
  def buyLevels(visible , hidden)  #(visible: Treasure [],  hidden : Treasure []) : boolean
    
  end
  
  def hasNecklace(array)
    resultado = false
    array.each do |k|
      if k.type == TreasureKind::NECKLACE
        resultado =true
      end
    end
    resultado
  end
  #Devuelve el nivel de combate del jugador, que viene dado por su nivel más los
  #bonus que le proporcionan los tesoros que tenga equipados, según las reglas del juego
  
  
  def getCombatLevel() 
    #cuando el max y min son distintos, suma el maximo cuando tiene de tipo collar,
  #sino suma el minimo
    resultado = @level
    tiene_collar = hasNecklace(@visibleTreasures)
    @visibleTreasures.each do |k|
      if (k.maxBonus != k.minBonus)
        if(tiene_collar)
          resultado += k.maxBonus
        else
          resultado += k.minBonus
        end
      end
    end
    @hiddenTreasures.each do |k|
      if (k.maxBonus != k.minBonus)
        if(tiene_collar)
          resultado += k.maxBonus
        else
          resultado += k.minBonus
        end
      end
    end
   
    resultado
  end
  
  #Devuelve true cuando el jugador no tiene ningún mal rollo que cumplir y no tiene
  #más de 4 tesoros ocultos y false en caso contrario.
  def validState() 
    if(@pendingBadConsequence.isEmpty() && @hiddenTreasures.size <= 4)
      respuesta = true
    else
      respuesta = false
    end
    
    respuesta
  end
  
  def initTreasures() #: boolean
    
  end
  
  
  #Devuelve true si el jugador esta muerto
  def isDead() 
    @dead
  end
  
  
  def hasVisibleTreasures()
    @visibleTreasures.empty?
  end
  
  def getVisibleTreasures()
    @visibleTreasures
  end
  
  def getHiddenTreasures() 
    @hiddenTreasures
  end
end



  jugador = Player.new("marta")
  puts jugador.validState()
  puts jugador.getCombatLevel()
  puts jugador.isDead()
  puts jugador.getVisibleTreasures()
  puts jugador.getHiddenTreasures() 
  puts jugador.hasVisibleTreasures()

