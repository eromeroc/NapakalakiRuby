
require_relative 'card'
require_relative 'cultist_player'

module Model
  class Cultist
    include Card
  
    attr_reader :name
    attr_reader :gainedLevels
  
    def initialize(n, g)
      @name = n
      @gaindeLevels = g 
    end
  
    def getBasicValue
      @gainedLevels
    end
  
    def getSpecialValue
      specialValue = getBasicValue() * CultistPlayer.getTotalCultistPlayers()
      
      specialValue
    end
  end
  
  sectario = Cultist.new("j1",2);
  puts sectario.getBasicValue()
  puts sectario.getSpecialValue()
  
end
