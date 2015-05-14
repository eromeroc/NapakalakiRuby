# coding: utf-8 

require_relative 'bad_consequence'
require_relative 'treasure'
require_relative 'monster'
require_relative 'card_dealer'
require_relative 'dice'
require_relative 'combat_result'

module Model
class Player

  attr_reader :pendingBadConsequence  #Objeto BadConsequence
  attr_reader :visibleTreasures       #Objeto Treasure
  attr_reader :hiddenTreasures        #Objeto Treasure
  attr_reader :dead
  attr_reader :name
  attr_reader :level
 
  
  def initialize(name)
    @dead = true
    @name = name
    @level = 1
    @@MAXHIDDENTREASURES = 4
    @visibleTreasures = Array.new
    @hiddenTreasures = Array.new
    @pendingBadConsequence = BadConsequence.new("Vacio",0,0,0); 
  end
  
  private  
  
  #Devuelve a la vida al jugador
  def bringToLive()
    @dead = false;
  end
  
  
  #Incrementa el nivel del jugador en i niveles
  #1 <=level <= 10 
  def incrementLevels(l)
    if (@level + l >= 10)
      @level = 10
    else
      @level = @level + l
    end
  end
  
  
  #Decrementa el nivel del jugador en i niveles
  #1 <=level <= 10  
  def decrementLevels(l)
    if (@level - l <= 1)
      @level = 1
    else
      @level = @level - l
    end
  end
  
  
  #Asigna el mal rollo al jugador
  def setPendingBadConsequence(b) #b : BadConsequence
    @pendingBadConsequence = b
  end
  
  
  #Cuando el jugador muere en un combate, esta operación es la encargada de dejarlo sin
  #tesoros, ponerle el nivel a 1 e indicar que está muerto, en el atributo correspondiente.
  def die()
    @dead = true
    @level = 1
    
    @visibleTreasures.each do|k|
      CardDealer.instance.giveTreasureBack(k)
    end
    @visibleTreasures.clear
    
    @hiddenTreasures.each do|k|
      CardDealer.instance.giveTreasureBack(k)
    end
    @hiddenTreasures.clear
    
  end
  
  
  #Si el jugador tiene equipado el tesoro tipo NECKLACE, se lo entrega al CardDealer y lo elimina de sus tesoros visibles.
  def discardNecklaceIfVisible()
    @visibleTreasures.each do |k|
      if k.type == TreasureKind::NECKLACE
        CardDealer.instance.giveTreasureBack(k) 
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
    buy = true
    l = i / 1000
    if (@level += l) >= 10
      buy = false
    end
    buy 
  end
  
  
  protected
  #Calcula y devuelve los niveles que puede comprar el jugador con la lista t de tesoros. El
  #número de niveles no es redondeado ni al alza ni a la baja y se expresa mediante un
  #número en coma flotante.
  def computeGoldCoinsValue(t) #(t : Treasure[]) : float
    goldCoinsValue = 0
    t.each do|k| 
      goldCoinsValue += k.goldCoins
    end
    niveles = goldCoinsValue / 1000 
    niveles
  end
  
  
  public
  #Cuando el jugador gana el combate, esta operación es la encargada de aplicar el buen 
  #rollo al jugador, sumando los niveles correspondiente y robando los tesoros indicados en el
  #buen rollo del monstruo.
  def applyPrize(p)   #(p : Prize) : void
    nLevels = p.levels
    nPrize = p.treasures
    
    incrementLevels(nLevels)
    
    for i in 0..nPrize-1 
      @hiddenTreasures << CardDealer.instance.nextTreasure()
    end
   
  end
  
=begin
    Si el nivel de jugador > nivel del monstruo {
            Se actualiza el nivel y tesoros del jugador y se invoca al operación applyPrize
            Devuelve Win si el jugador no gana la partida (nivel del jugador <10).
            Devuelve WinAndWinGame si el jugador gana la partida.
      }
      Si el nivel del jugador es <= nivel del monstruo {
        Se lanza el dado
        Si sale 5 ó 6, {
            No pasa nada y se devuelve LooseAndEscape
        } en otro caso {
            Se analiza en qué consiste el mal rollo
            Si el jugador muere {
                Se invoca a la operación die
                Se devuelve LoseAndDie
            } en otro caso {
                Se invoca a la operación applyBadConsequence
                Se devuelve Lose
            }
        }
      }
    
=end
  def combat(m)  #(m : Monster) : CombatResult
    level = getCombatLevel()
    if level > getOponentLevel(m)
      applyPrize(m.prize)  
      if @level < 10
        result = CombatResult::WIN
      else
        result = CombatResult::WINANDWINGAME
      end
    else #@level <= getOponentLevel(m)
      num = Dice.instance.nextNumber
      if num >= 5
        result = CombatResult::LOSEANDESCAPE
      else
        if m.bc.kills() == true
          die
          result = CombatResult::LOSEANDDIE
        else
          if (shouldConvert)
            result = CombatResult::LOSEANDCONVERT
          else
            applyBadConsequence(m.bc)
            result = CombatResult::LOSE
          end
        end
      end
    end
    discardNecklaceIfVisible()
    result
  end
  
  #Decrementa sus niveles según indica el mal rollo y guarda una copia de un objeto
  #badConsequence ajustada a los tesoros que puede perder según indique el mal rollo del
  #monstruo y de los tesoros que disponga el jugador. La operación encargada de hacer este
  #ajuste es adjustToFitTreasureLists de la clase badConsequence. El mal rollo
  #pendiente (pendingbadConsequence) es el que el jugador almacenará y que deberá
  #cumplir descartándose de esos tesoros antes de que pueda pasar al siguiente turno.
  def applyBadConsequence(bad) #(bad : BadConsequence) : void
    decrementLevels(bad.levels)
    
    @pendingBadConsequence = bad.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
    setPendingBadConsequence(@pendingBadConsequence)
    
  end
  
  # Pasa tersoros ocultos a visibles, siempre que pueda hacerlo según las reglas 
  def makeTreasureVisible(t) # (t: Treasure) : boolean  
     make = false
        
        if(canMakeTreasureVisible(t))
            @visibleTreasures << t
            @hiddenTreasures.delete(t)
            make = true
        end
        
        make
   
  end
  
  #Comprueba si el tesoro (t) se puede pasar de oculto a visible, según las reglas del juego
  def canMakeTreasureVisible(t) # (t : Treasure) : boolean
   
   canMakeVisible = true
   
   contador = 0 
   hasBothHands = false
   
  @visibleTreasures.each do |k| 
    if (k.type == t.type)
     canMakeVisible = false
    end
    if (k.type == TreasureKind::ONEHAND)
      contador = contador +1
    end
    if (k.type == TreasureKind::BOTHHANDS)
      hasBothHands = true
    end
  end
    
  if(t.type == TreasureKind::ONEHAND) 
    if(contador < 2)
      canMakeVisible = true
    end
    if(hasBothHands)
      canMakeVisible = false
    end
    
  end
  
  if ((t.type == TreasureKind::BOTHHANDS) && (contador != 0))
    canMakeVisible = false
  end
  
        
    canMakeVisible
end
  
  # Eliminar los tesoros visibles indicados de la lista de tesoros
  # visibles del jugador. Al eliminar esos tesoros, si el jugador tiene un mal rollo pendiente, se
  # indica a éste dicho descarte para su posible actualización.
  def discardVisibleTreasure(t) # (t : Treasure) : void 
    
    if @pendingBadConsequence != nil && !@pendingBadConsequence.isEmpty
      @pendingBadConsequence.substractVisibleTreasure(t)
    
    end
      #Se puede hacer mejor? 
      @visibleTreasures.each do |k|
        if k == t
          @visibleTreasures.delete(k)
        end
      end
      
      CardDealer.instance.giveTreasureBack(t)
      dieIfNoTreasures
    
  end
  
  # Eliminar los tesoros ocultos indicados de la lista de tesoros
  # ocultos del jugador. Al eliminar esos tesoros, si el jugador tiene un mal rollo pendiente, se
  # indica a éste dicho descarte para su posible actualización.
  def discardHiddenTreasure(t) # (t : Treasure) : void
      if @pendingBadConsequence != nil && !@pendingBadConsequence.isEmpty
        @pendingBadConsequence.substractHiddenTreasure(t)
      end
      
      @hiddenTreasures.each do |k|
        if k == t
          @hiddenTreasures.delete(k)
        end
      end
      CardDealer.instance.giveTreasureBack(t)
      dieIfNoTreasures
  end
  
  # Permite comprar niveles antes de combatir con el monstruo actual. Para
  # ello, a partir de las listas de tesoros (pueden ser tanto ocultos como visibles) se calculan
  # los niveles que puede subir el jugador en función del número de piezas de oro que sumen.
  # Si al jugador le está permitido comprar la cantidad de niveles resultantes (no se puede
  # comprar niveles si con ello ganas el juego), entonces se produce el mencionado
  # incremento
  def buyLevels(visible , hidden)  #(visible: Treasure [],  hidden : Treasure []) : boolean

    l = computeGoldCoinsValue(visible)
    l += computeGoldCoinsValue(hidden)
    
    canI = canIBuyLevels(l)
    
    if(canI)
      incrementLevels(l)
      
      visible.each do |k|
        discardVisibleTreasure(k)
      end
      
      hidden.each do |k|
        discardHiddenTreasure(k)
      end
    end
    canI
  end
  
  # Devuelve true si el jugador tiene equipado un tesoro de tipo collar en el array pasado
  def hasNecklace
    hasNecklace = false
    
    @visibleTreasures.each do |k|
      if k.type == TreasureKind::NECKLACE
        hasNecklace =true 
      end
    end

    hasNecklace
  end
  
  #Devuelve el nivel de combate del jugador, que viene dado por su nivel más los
  #bonus que le proporcionan los tesoros que tenga equipados, según las reglas del juego 
  def getCombatLevel() 
    
    combatLevel = @level
    necklace = hasNecklace
    
    if(necklace)
      @visibleTreasures.each do |k|
          combatLevel += k.maxBonus
      end
    else
      @visibleTreasures.each do |k|
          combatLevel += k.minBonus
      end
    end
  
    combatLevel
  end
  
  
  #Devuelve true cuando el jugador no tiene ningún mal rollo que cumplir y no tiene
  #más de 4 tesoros ocultos y false en caso contrario.
  def validState() 
    valid = false
    if(@pendingBadConsequence.isEmpty() && @hiddenTreasures.size <= @@MAXHIDDENTREASURES)
      valid = true
    end
    
    valid
  end
  
  #Cuando un jugador está en su primer turno o se ha quedado sin tesoros ocultos o visibles,
  #hay que proporcionarle nuevos tesoros para que pueda seguir jugando. El número de
  #tesoros que se les proporciona viene dado por el valor que saque al tirar el dado:
  # .Si (dado == 1) roba un tesoro.
  # .Si (1 < dado< 6) roba dos tesoros.
  # .Si (dado == 6) roba tres tesoros.
  
  def initTreasures() #: boolean
    bringToLive()
    number = Dice.instance.nextNumber()
    
    if(number == 1)
      @hiddenTreasures << CardDealer.instance.nextTreasure()
      else 
        if(number == 6)
          for i in 0..2 
            @hiddenTreasures << CardDealer.instance.nextTreasure()
          end
        else
          for i in 0..1
            @hiddenTreasures << CardDealer.instance.nextTreasure()
          end
      end 
    
    end
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
  
  def to_s()
    output = "\nNombre:= "+@name+ "\n\tNivel: "+@level.to_s
      if(@pendingBadConsequence.isEmpty())
        output +=  "\n\tNo tienes mal rollo pendiente"
      else
        output += "\n\tMal rollo pendiente: "+@pendingBadConsequence.to_s
      end
      
    output
  end
  
  def getName()
    @name
  end
  
  #Constructor de copia
  #¿¿¿¿Tiene que ser un constructor o en ruby es otro metodo y ya???
  def self.copyPlayer(player)
        @dead = player.dead
        @name = player.name
        @level = player.level
        @hiddenTreasures = player.hiddenTreasures
        @visibleTreasures = player.visibleTreasures
        @pendingBadConsequence= player.pendingBadConsequence
  end
  
  protected
  def getOponentLevel(m)
    m.getBasicValue
    
  end
  
  def shouldConvert
    number = Dice.instance.nextNumber
    
    if(number == 6)
      convert = true
    else
      convert = false
    end
    
    convert   
  end

end

#PRUEBA PLAYER



#  jugador = Player.new("marta")
#  puts jugador.to_s
#  puts jugador.isDead()
# 
#
#  puts jugador.validState()
#  puts jugador.getCombatLevel()
#  puts jugador.isDead
#   puts jugador.getVisibleTreasures()
#   puts jugador.getHiddenTreasures() 
#   puts jugador.hasVisibleTreasures()
#   
#
#   unusedTreasures = Array.new
#   tesoro1 = Treasure.new("¡Sí mi amo!", 0, 4, 7, TreasureKind::HELMET)
#   unusedTreasures<< tesoro1
#   unusedTreasures<< Treasure.new("Botas de investigación", 600, 3, 4, TreasureKind::SHOE)
#   unusedTreasures<< Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::HELMET)
#   unusedTreasures<< Treasure.new("A prueba de babas", 400, 2, 5, TreasureKind::ARMOR)
#  
# 
#   tesoro2 = Treasure.new("Garabato místico", 300, 2, 2, TreasureKind::ONEHAND)
#   puts jugador.canMakeTreasureVisible(tesoro1)
#   puts jugador.canMakeTreasureVisible(tesoro2)

end
