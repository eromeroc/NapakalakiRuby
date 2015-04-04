
require 'singleton'
require_relative 'treasure'
require_relative 'monster'

class CardDealer
  
  atrr_reader :usedMonsters     #Array Monster
  atrr_reader :unusedMonsters   #Array Monster
  atrr_reader :usedTreasures    #Array Treasure
  atrr_reader :unusedTreasures  #Array Treasure
  
  
  include Singleton
=begin
  −instance : CardDealer = null
  −CardDealer()
=end 
  
  def initialize
    
  end
  private_class_method :new
  
  
  private
  def initTreasureCardDeck()
    
  end
  
  def initMonsterCardDeck()
    
  end
  
  def shuffleTreasures()
    
  end
  
  def shuffleMonsters()
    
  end
  
  
  public
  def self.getInstance()
    
  end
  
  def nextTreasure()
    
  end
  
  def nextMonster()
    
  end
  
  def giveTreasureBack(t)    #t : Treasure
    
  end
  
  def giveMonsterBack(m)     #m : Monster
    
  end
  
  def initCards()
    initTreasuresCardDeck()
    initMonstersCardDeck()
  end
  
end
