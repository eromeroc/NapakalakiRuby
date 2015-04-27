# coding: utf-8 
require 'singleton'
require_relative 'card_dealer'
require_relative  'player'
require_relative  'treasure'
require_relative  'combat_result'

class Napakalaki
  include Singleton
  
  
  attr_reader :currentMonster   #Objeto Monster
  attr_reader :currentPlayer    #Objeto Player
  attr_reader :players          #Array de players ¿A partir de 1?
  attr_reader :currentPlayerIndex #¿Donde lo inicializo a -1?

  private
  def initialize
    @currentPlayerIndex = -1
    @players = Array.new
  end
  
  #Inicializa el array de players
  def initPlayers(names) # (names : string[]) : void
      names.each do |k|
            @players << Player.new(k)
      end
      @currentPlayer = players[0];
  end
  
  #Da valores a currentPlayer, currentPlayerIndex y devuelve el Player currentPlayer
  def nextPlayer() # : Player
    if(@currentPlayerIndex == -1)
      siguiente = rand(@players.size())
    else
      if(@currentPlayerIndex == players.size()-1)
        siguiente = 0
        
      else        
        siguiente = @currentPlayerIndex +1;
      end
    
    end
    @currentPlayerIndex = siguiente
    @currentPlayer = @players[siguiente]
    @currentPlayer    
  end
  
  public
 
  def combat() # : CombatResult
    result = @currentPlayer.combat(@currentMonster)
    result
  end 
  
#  Operación encargada de eliminar los tesoros visibles indicados de la lista de tesoros
#  visibles del jugador. Al eliminar esos tesoros, si el jugador tiene un mal rollo pendiente, se
#  indica a éste dicho descarte para su posible actualización.
  def discardVisibleTreasure(t) # (t : Treasure) : void
    @currentPlayer.discardVisibleTreasure(t)
  end
  
#  Análoga a la operación anterior aplicada a tesoros ocultos. Realizar el correspondiente
#  diagrama de secuencia.
  def discardHiddenTreasure(t) # (t : Treasure) : void
    @currentPlayer.discardHiddenTreasure(t)
  end
  
  
#  Operación en la que el jugador pasa tesoros ocultos a visibles, siempre que pueda hacerlo
#  según las reglas del juego, para ello llama al método, para ello desde Player se ejecuta el
#  método: canMakeTreasureVisible(t:Treasure ):boolean
  def makeTreasureVisible(t) # (t : Treasure) : boolean
    makeVisible = false
    if canMakeTreasureVisible(t)
      makeVisible = true
      @currentPlayer.makeTreasureVisible(t)
      @currentPlayer.discardHiddenTreasure(t)
    end
    
    makeVisible
  end
  
  
#  Esta operación permite comprar niveles antes de combatir con el monstruo actual. Para
#  ello, a partir de las listas de tesoros (pueden ser tanto ocultos como visibles) se calculan
#  los niveles que puede subir el jugador en función del número de piezas de oro que sumen.
#  Si al jugador le está permitido comprar la cantidad de niveles resultantes (no se puede
#  comprar niveles si con ello ganas el juego), entonces se produce el mencionado
#  incremento.
  def buyLevels(visible, hidden) # (visible : Treasure[], hidden : Treasure[]) :boolean
    @currentPlayer.buyLevels(visible, hidden)
  end
  
#  Se encarga de solicitar a CardDealer la inicialización de los mazos de cartas de
#  Tesoros y de Monstruos, de inicializar los jugadores proporcionándoles un nombre y de
#  iniciar el juego con la llamada a nextTurn() para pasar al siguiente turno (que en este
#  caso será el primero).
  def initGame(players)  #(players : String[]) : void
    CardDealer.instance.initCards
    initPlayers(players)
    nextTurn
  end
  
  def getCurrentPlayer()  # : Player
    @currentPlayer
  end
  
  def getCurrentMonster() # : Monster
    @currentMonster
  end
  
  def canMakeTreasureVisible(t) # (t: Treasure) : boolean
    @currentPlayer.canMakeTreasureVisible(t)
  end
  
  def getVisibleTreasures() # : Treasure[]
  
  end
  
  def getHiddenTreasures() # : Treasure[]
  
  end
  
#  Esta operación usa el método nextTurnAllowed(), para verificar si el jugador activo
# (currentPlayer) cumple con las reglas del juego para poder terminar su turno.
# En caso el caso que nextTurnAllowed() devuelva true, se actualiza el jugador activo
# al siguiente jugador y se le solicita a CardDealer el siguiente monstruo al que se
# enfrentará ese jugador (currentMonster).
# En caso de que el nuevo jugador activo esté muerto, por el combate en su anterior turno o
# porque es el primer turno, se inicializan sus tesoros siguiendo las reglas del juego. La
# inicialización de los tesoros se encuentra recogida en el diagrama subordinado
# initTreasures.
  def nextTurn()  # : boolean
    nextPlayer
    stateOk = nextTurnAllowed
    if stateOk
      @currentMonster = CardDealer.instance.nextMonster
      
#      if @currentPlayer.isDead
        @currentPlayer.initTreasures
      #end
    end
    
    stateOk
  end
  
  def nextTurnAllowed() # : boolean
    nextTurnAllowed = false
    if(@currentPlayer.validState == true)
      nextTurnAllowed = true
    end 
    nextTurnAllowed
  end
  
#Devuelve true si result tiene el valor WINANDWINGAME del enumerado CombatResult, en
#caso contrario devuelve false.

  def endOfGame(result) # (result : CombatResult) : boolean
    endOfGame = false
    
    if(result == CombatResult::WINANDWINGAME)
      endOfGame = true
    end
    
    endOfGame
  end
  
end

#PRUEBA NAPAKALAKI

napakalaki = Napakalaki.instance
napakalaki.initGame(["nombre1", "nombre2"])
napakalaki.nextTurn()
napakalaki.discardVisibleTreasure([TreasureKind::ARMOR])
napakalaki.discardHiddenTreasure([TreasureKind::ARMOR])
napakalaki.combat
napakalaki.buyLevels([Treasure.new("¡Sí mi amo!", 0, 4, 7, TreasureKind::HELMET)],[Treasure.new("¡Sí mi amo!", 0, 4, 7, TreasureKind::HELMET)])

puts napakalaki.makeTreasureVisible(Treasure.new("¡Sí mi amo!", 0, 4, 7, TreasureKind::HELMET))
puts napakalaki.endOfGame(CombatResult::WIN)
puts "Prueba Napakalaki"
