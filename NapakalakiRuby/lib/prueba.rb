require_relative 'bad_consequence'
require_relative 'bad_consequence_death'
require_relative 'bad_consequence_num_treasures'
require_relative 'bad_consequence_type_treasures'
require_relative 'cultist'
require_relative 'cultist_player'
require_relative 'player'
require_relative 'treasure'
require_relative 'prize'
require_relative 'monster'
require_relative 'card_dealer'


module Model

  if __FILE__ == $0
    
    #TESOROS: Nombre, coins, min, max, kind
    tVisibles = Array.new
    tHidden = Array.new
    tVisibles << Treasure.new("Treasure", 0, 4, 7, TreasureKind::HELMET)
    tHidden << Treasure.new("Treasure", 0, 4, 7, TreasureKind::HELMET)
    
    #BADCONSEQUENCE: visibles-ocultos
    bcType = BadConsequenceTypeTreasures.new("BcType",0, [TreasureKind::ARMOR, TreasureKind::HELMET],
        [TreasureKind::ARMOR])
    bcNum = BadConsequenceNumTreasures.new("BcType",0, 2, 1)
    bcDeath = BadConsequenceDeath.new("BcDeath") 
    
    #MONSTER: nivel, bc, prize, cultist?
    prize1 = Prize.new(2, 1)
    monster1 = Monster.new("monster1", 8, bcType, prize1,0)
    
    
    #PLAYER
    j1 = Player.new("j1")
    j2 = Player.new("j2")
    j3 = Player.new("j3")
    
    j1.setPendingBadConsequence(bcType)
   
    #CULTIST Y CULTIST PLAYER
    cult1 = Cultist.new("sect1",2)
    sect1 = CultistPlayer.new(j1, cult1)
   
    puts j1.validState
    
    puts sect1.getCombatLevel
    
    puts cult1.getBasicValue
    puts cult1.getSpecialValue
  end

end 