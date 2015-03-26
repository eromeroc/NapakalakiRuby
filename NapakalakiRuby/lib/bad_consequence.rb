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
    new(aText,someLevels, someVisibleTreasures, someHiddenTreasures, Array.new, Array.new,false)
  end
  
  def self.newDeath (aText)
    new(aText, 0, 0, 0 , Array.new, Array.new, true)
  end
    
  def self.newSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, someHiddenTreasures)
    new(aText, someLevels, 0, 0, someSpecificVisibleTreasures, someHiddenTreasures,false)
  end
  
  def self.newVacio()
    new(" ", 0,0, 0, Array.new, Array.new, false)
  end
  private_class_method :new

 def isEmpty()
   if @text == " " && @nVisibleTreasures == 0 && @nHiddenTreasures == 0 && @specificHiddenTreasures == Array.new && @specificVisibleTreasures == Array.new && @death  == false
     respuesta = true
   else
     respuesta = false
     #Devuelve true cuando el mal rollo está vacío. Eso significa que el conjunto de
#atributos del mal rollo indican que no hay mal rollo que cumplir, plantéate qué
#valores deberán tener.
   end
  respuesta
 end
    
    def kills()
        @death;
    end
  
  
  def arrayToString(array)
    texto = "\n\t"
    
    array.each do |i| 
      texto += (i.to_s + " ")
    end
  end
  
  
  def to_s
        output = "\n\t\tMal rollo = #{@text}"+
        "\n\tNiveles que pierdes = #{@levels}"+
        "\n\tNº de tesoros escondidos #{@nHiddenTreasures}"+
        "\n\tNº de tesoros visibles = #{@nVisibleTreasures}"+
        "\n\tMuerte = #{@death}"+
        "\n\tTesoros ocultos = #{arrayToString(@specificHiddenTreasures)}"+
        "\n\tTesoros visibles = #{arrayToString(@specificVisibleTreasures)}"
      
    output
  end
end
