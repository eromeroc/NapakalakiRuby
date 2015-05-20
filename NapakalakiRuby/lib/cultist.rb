require_relative 'cultist_player'

module Model
  class Cultist
  
    attr_reader :name
    attr_reader :gainedLevels
  
    def initialize(n, g)
      @name = n
      @gainedLevels = g 
    end
  
    def getBasicValue
      @gainedLevels
    end
  
    def getSpecialValue
      specialValue = getBasicValue() * CultistPlayer.getTotalCultistPlayers
      
      specialValue
    end
  end
  
  sectario = Cultist.new("j1",2);
  puts sectario.getBasicValue()
  puts sectario.getSpecialValue()
  
end
