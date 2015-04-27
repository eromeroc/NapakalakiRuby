# coding: utf-8

module Model
class Monster
    attr_reader :name
    attr_reader :combatLevel
    attr_reader :bc
    attr_reader :prize
    
    
    def initialize(name, combatLevel, bc, prize)
        @name = name
        @combatLevel = combatLevel
        @bc = bc
        @prize = prize
    end
    
    
    def to_s
        output = "\nNombre:= #{@name}"+
        "\n\tNivel: #{@combatLevel}"+
        "\n\tPremio: #{@prize.to_s}"+
        "\n\tMal rollo: #{@bc.to_s}"
      
      output
    end
    
end
end