# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Prize
    atr_readder :treasures
    atr_readder :levels
    
    def initialize(treasures, levels)
        @treasures = treasures
        @levels = levels
    end
    
    def toString
        puts "Treasures: #{treasures}
        Levels: #{levels}"
    end
end
