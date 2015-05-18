# coding: utf-8 

require_relative 'treasure'
module Model
  
 class BadConsequence
    
    attr_reader :text              #Mal rollo
    attr_reader :levels            #Niveles que se pierden
    attr_reader :nHiddenTreasures  #Nº tesoros ocultos que se pierden
    attr_reader :nVisibleTreasures #Nº tesoros visibles que se pierden
    attr_reader :death             #Mal rollo de tipo muerte
    attr_reader :specificHiddenTreasures  #Tesorros ocultos
    attr_reader :specificVisibleTreasures  #Tesoros visible

 # private_class_method :new
  
#   def initialize
#    @text = aText
#    @levels = someLevels
#    @nVisibleTreasures = someVisibleTreasures
#    @nHiddenTreasures = someHiddenTreasures
#    @specificHiddenTreasures  = someSpecificHiddenTreasures 
#    @specificVisibleTreasures = someSpecificVisibleTreasures 
#    @death = true
#   end

  #Devuelve true cuando el mal rollo está vacío. Eso significa que el conjunto de
  #atributos del mal rollo indican que no hay mal rollo que cumplir.
  def isEmpty()
    
  end
 
  #Devuelve true si el mal rollo es muerte
  def kills()
     @death
  end
  
  #Actualiza el mal rollo (que tiene que cumplir el jugador) basándose en el hecho de que el
  #jugador se descarta del tesoro visible t.
  def substractVisibleTreasure(t) # (t : Treasure) : void
    
  end
  
  #Actualiza el mal rollo (que tiene que cumplir el jugador) basándose en el hecho de que el
  #jugador se descarta del tesoro oculto t.
  def substractHiddenTreasure(t) # (t : Treasure) : void
    
  end
  
  #Recibe como parámetros los tesoros visibles y ocultos de los que dispone el jugador y
  #devuelve un nuevo objeto mal rollo creado a partir del objeto mal rollo que ejecuta este
  #método.
  #El objeto de mal rollo devuelto por adjustToFitTreasureLists solo contendrá listas
  #de tipos de tesoros o cantidades de tesoros de forma que el jugador correspondiente
  #pueda cumplir el mal rollo generado.
  def adjustToFitTreasureLists(v, h) # (v : Treasure[], h : Treasure[]) : BadConsequence
    
  end
 
  
  
  def arrayToString(array)
    texto = " "
    
    array.each do |i| 
      texto += (i.to_s + " ")
     end
     texto
  end
 
  def to_s
      
  end
end

#PRUEBA BADCONSEQUENCE

=begin
bc = BadConsequence.newNumberOfTreasures("Pierdes todos tus tesores visibles.\n", 1, 4, 0)
t = Treasure.new("¡Sí mi amo!", 0, 4, 7, TreasureKind::HELMET)
bc.substractVisibleTreasure(t)
bc.substractHiddenTreasure(t)

puts bc.to_s
puts "Prueba Bad Consequence"
=end


end
