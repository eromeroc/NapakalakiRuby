# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

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
        puts "\nNombre = #{@name}
        \nNivel = #{@combatLevel}
        \nPremio = #{@prize.to_s}
        \nMal rollo = #{@bc.to_s}"
    end
    
end
