# coding: utf-8 

require_relative 'treasure'

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
    if(@nVisibleTreasures > 0)
      @nVisibleTreasures = @nVisibleTreasures -1
    else
      TreasureKind substract = nil
      @specificVisibleTreasures.each do |i|
        if(i == t.type)
          substract = i
        end
      end
      if substract != nil
        @specificVisibleTreasures.remove(substract)
      end
    end
  end
  
  #Igual que el anterior, pero para los ocultos.
  def substractHiddenTreasure(t) # (t : Treasure) : void
    if(@nHiddenTreasures > 0)
      @nHiddenTreasures = @nHiddenTreasures -1
    else
      TreasureKind substract= nil
      @specificHiddenTreasures.each do |i|
        if(i == t.type)
          substract = i
        end
      end
      if substract != nil
        @specificHiddenTreasures.remove(substract)
      end
    end
  end
  #Recibe como parámetros los tesoros visibles y ocultos de los que dispone el jugador y
  #devuelve un nuevo objeto mal rollo creado a partir del objeto mal rollo que ejecuta este
  #método.
  #El objeto de mal rollo devuelto por adjustToFitTreasureLists solo contendrá listas
  #de tipos de tesoros o cantidades de tesoros de forma que el jugador correspondiente
  #pueda cumplir el mal rollo generado.
  def adjustToFitTreasureLists(v, h) # (v : Treasure[], h : Treasure[]) : BadConsequence
    
    visible = Array.new
    hidden = Array.new
    
    v.each do |i|
      visible << i.type
    end
    
    h.each do |k|
      hidden << k.type
    end
    
    
    bc = BadConsequence.newSpecificTreasures("Nuevo mal rollo", 0, visible, hidden)
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

#PRUEBA BADCONSEQUENCE
=begin

bc = BadConsequence.newNumberOfTreasures("Pierdes todos tus tesores visibles.\n", 1, 4, 0)
t = Treasure.new("¡Sí mi amo!", 0, 4, 7, TreasureKind::HELMET)
bc.substractVisibleTreasure(t)
bc.substractHiddenTreasure(t)

puts bc.to_s
puts "Prueba Bad Consequence"

=end