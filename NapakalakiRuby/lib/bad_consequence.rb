# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

# -*- coding: utf-8 -*-

class BadConsequence
    
    attr_reader :text              #Mal rollo
    attr_reader :levels            #Niveles que se pierden
    attr_reader :nHiddenTreasures  #Nº tesoros ocultos que se pierden
    attr_reader :nVisibleTreasures #Nº tesoros visibles que se pierden
    attr_reader :death             #Mal rollo de tipo muerte
    attr_reader :specificHiddenTreasures  #Tesorros ocultos
    attr_reader :specificVisibleTreasures  #Tesoros visibles
    
  def initialize(text, death)
    @text = text
    @death = death
    
    @levels = 0 
    @nHiddenTreasures = 0
    @nVisibleTreasures = 0
    @specificHiddenTreasures = Array.new
    @specificVisibleTreasures = Array.new   
  end
  
  def initialize(text, levels, specificHiddenT, specificVisibleT)
    @text = text
    @levels = levels
    @nHiddenTreasures = 0
    @nVisibleTreasures = 0
    @death = false
    @specificHiddenTreasures = specificHiddenT
    @specificVisibleTreasures = specificVisibleT    
  end
  
  def initialize(text, levels, nHiddenT, nVisibleT)
    @text = text
    @levels = levels
    @nHiddenTreasures = nHiddenT
    @nVisibleTreasures = nVisibleT
    @death = false
    @specificHiddenTreasures = Array.new
    @specificVisibleTreasures = Array.new    
  end
  
  def arrayToString(array)
    texto = "\n"
    for array in 0.. array.size do
      texto += (array.to_s + " ")
    end
  end
  
  
  def toString
        puts "Mal rollo = #{text}
        Levels = #{levels}
        Nº de tesoros escondidos "+ @nHiddenTreasures.to_s +
        "Nº de tesoros visibles = #{nVisibleTreasures.to_s}
        Muerte = #{death}
        Tesoros ocultos = #{arrayToString(@specificHiddenTreasures)}
        Tesoros visibles = #{arrayToString(@specificVisibleTreasures)}"
  end
  
end
