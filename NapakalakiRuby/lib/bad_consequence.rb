# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
    
    attr_readder :text              #Mal rollo
    attr_readder :levels            #Niveles que se pierden
    attr_readder :nHiddenTreasures  #Nº tesoros ocultos que se pierden
    attr_readder :nVisibleTreasures #Nº tesoros visibles que se pierden
    attr_readder :death             #Mal rollo de tipo muerte
    attr_readder :specificHiddenTreasures   #Tesorros ocultos
    attr_readder :specificVisibleTreasures  #Tesoros visibles
    
  def initialize(text, levels, nHiddenT, nVisibleT, death, specificHiddenT, specificVisibleT)
    @text = text
    @levels = levels
    @nHiddenTreasures = nHiddenT
    @nVisibleTreasures = nVisibleT
    @death = death
    @specificHiddenTreasures = specificHiddenT
    @specificVisibleTreasures = specificVisibleT    
  end
  
  def toString
        puts "Mal rollo = #{text}
        Levels = #{levels}
        Nº de tesoros escondidos = #{nHiddenT}
        Nº de tesoros visibles = #{nVisibleT}
        Muerte = #{death}
        Tesoros ocultos = #{}"
  end
  
end
