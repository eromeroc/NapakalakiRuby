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
  

  #Devuelve true cuando el mal rollo está vacío. Eso significa que el conjunto de
  #atributos del mal rollo indican que no hay mal rollo que cumplir.
  def isEmpty()
    if @text == " " && @nVisibleTreasures == 0 && @nHiddenTreasures == 0 && @specificHiddenTreasures.empty? &&
       @specificVisibleTreasures.empty? && @death  == false
    
      respuesta = true
    else
      respuesta = false    
    end
   respuesta
  end
 
 
  #Devuelve true si el mal rollo es muerte
  def kills()
     @death
  end
  
  #Actualiza el mal rollo (que tiene que cumplir el jugador) basándose en el hecho de que el
#jugador se descarta del tesoro visible t.
  def substractVisibleTreasure(t) # (t : Treasure) : void
    @specificVisibleTreasures << t
  end
  
  #Igual que el anterior, pero para los ocultos.
  def substractHiddenTreasure(t) # (t : Treasure) : void
    @specificHiddenTreasures << t
  end
  
  def adjustToFitTreasureLists(v, h) # (v : Treasure[], h : Treasure[]) : BadConsequence
    
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
