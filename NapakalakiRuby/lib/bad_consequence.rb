# coding: utf-8 


class BadConsequence
    
    attr_reader :text              #Mal rollo
    attr_reader :levels            #Niveles que se pierden
    attr_reader :nHiddenTreasures  #Nº tesoros ocultos que se pierden
    attr_reader :nVisibleTreasures #Nº tesoros visibles que se pierden
    attr_reader :death             #Mal rollo de tipo muerte
    attr_reader :specificHiddenTreasures  #Tesorros ocultos
    attr_reader :specificVisibleTreasures  #Tesoros visibles
    


  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
    @text = aText
    @levels = someLevels
    @nVisibleTreasures = someVisibleTreasures
    @nHiddenTreasures = someHiddenTreasures
    @specificHiddenTreasures  = someSpecificHiddenTreasures 
    @specificVisibleTreasures = someSpecificVisibleTreasures 
    @death = death
  end
  
  def self.newNumberOfTreasures (aText, someLevels, someVisibleTreasures, someHiddenTreasures)
    initialize(aText,someLevels, someVisibleTreasures, someHiddenTreasures, Array.new, Array.new,false)
  end
  
  def self.newDeath (aText)
    initialize(aText, 0, 0, 0 , Array.new, Array.new, true)
  end
    
  def self.newSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, someHiddenTreasures)
    initialize(aText, someLevels, 0, 0, someSpecificVisibleTreasures, someHiddenTreasures)
  end
  
  private_class_method :new

  def arrayToString(array)
    texto = "\n"
    for array in 0.. array.size do
      texto += (array.to_s + " ")
    end
  end
  
  
  def to_s
        puts "\nMal rollo = #{text}
        \nNiveles que pierdes = #{levels}
        \nNº de tesoros escondidos #{nHiddenTreasures}
        \nNº de tesoros visibles = #{nVisibleTreasures}
        \nMuerte = #{death}
        \nTesoros ocultos = #{arrayToString(@specificHiddenTreasures)}
        \nTesoros visibles = #{arrayToString(@specificVisibleTreasures)}"
  end
end
