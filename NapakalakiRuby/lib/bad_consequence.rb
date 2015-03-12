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
  
  def newNumberOfTreasures (aText, someLevels, someVisibleTreasures, someHiddenTreasures)
    initialize(aText,someLevels, someVisibleTreasures, someHiddenTreasures, Array.new, Array.new,false)
  end
  
  def newDeath (aText,death)
    initialize(aText, 0, 0, 0 , Array.new, Array.new, death)
  end
  
  
  
  private_class_method :new

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
