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
  
  
  #Si el jugador tiene equipado el tesoro tipo NECKLACE, se lo entrega al CardDealer y lo elimina de sus tesoros visibles.
  def discardNecklaceIfVisible()
    @visibleTreasures.each do |k|
      if k.type == TreasureKind::NECKLACE
        giveTreasureBack(k)
        @visibleTreasures.delete(k)
      end
    end
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
  
  
  #protected
  public
  #Calcula y devuelve los niveles que puede comprar el jugador con la lista t de tesoros. El
#número de niveles no es redondeado ni al alza ni a la baja y se expresa mediante un
#número en coma flotante.
  def computeGoldCoinsValue(t) #(t : Treasure[]) : float
    oro = 0
    t.each do|k| 
      oro += k.goldCoins
    end
    niveles = oro / 100.0
    niveles
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
  
  #Comprueba si el tesoro (t) se puede pasar de oculto a visible, según las reglas del juego
  def canMakeTreasureVisible(t) # (t : Treasure) : boolean
   #Cada jugador puede equiparse con un único tesoro de cada tipo
   resultado = true
   @visibleTreasures.each do |k| 
     if k == t
       resultado = false
     end
   end
   resultado
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
#  puts jugador.validState()
#  puts jugador.getCombatLevel()
#  puts jugador.isDead()
#  puts jugador.getVisibleTreasures()
#  puts jugador.getHiddenTreasures() 
#  puts jugador.hasVisibleTreasures()
#  puts jugador.discardNecklaceIfVisible()  #privado
  
#  unusedTreasures = Array.new
#  tesoro1 = Treasure.new("¡Sí mi amo!", 0, 4, 7, TreasureKind::HELMET)
#  unusedTreasures<< tesoro1
#  unusedTreasures<< Treasure.new("Botas de investigación", 600, 3, 4, TreasureKind::SHOE)
#  unusedTreasures<< Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::HELMET)
#  unusedTreasures<< Treasure.new("A prueba de babas", 400, 2, 5, TreasureKind::ARMOR)
##  puts jugador.computeGoldCoinsValue(unusedTreasures)     #protegido
#
#  tesoro2 = Treasure.new("Garabato místico", 300, 2, 2, TreasureKind::ONEHAND)
#  puts jugador.canMakeTreasureVisible(tesoro1)
#  puts jugador.canMakeTreasureVisible(tesoro2)

#Como añado un tesoro ????
