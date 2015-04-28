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
    if  ((@nVisibleTreasures == 0) && (@nHiddenTreasures == 0) && (@specificHiddenTreasures.empty?) &&
      (@specificVisibleTreasures.empty?) && (@death  == false) && (@levels == 0))
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
        @specificVisibleTreasures.delete(substract)
      end
    end
  end
  
  #Actualiza el mal rollo (que tiene que cumplir el jugador) basándose en el hecho de que el
  #jugador se descarta del tesoro oculto t.
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
        @specificHiddenTreasures.delete(substract)
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
    
    
    if (v.empty? && h.empty?)
      bc = BadConsequence.newVacio
    else
      if (@nVisibleTreasures > 0  || @nHiddenTreasures >0)
        if (@nVisibleTreasures > v.size())
          nVisible = v.size()
        else
          nVisible = @nVisibleTreasures
        end
        if (@nHiddenTreasures > h.size())
          nHidden = h.size()
        else
          nHidden = @nHiddenTreasures
        end
        bc = BadConsequence.newNumberOfTreasures(@text,0,nVisible, nHidden)
      else
        visible = Array.new
        hidden = Array.new
        v.each do |i|
          @specificVisibleTreasures.each do |j|
            if j == i.type
              visible << j
            end
          end
        
        end
    
        h.each do |k|
          @specificHiddenTreasures.each do |j|
            if j == k.type
              hidden << j
            end
          end
        end
      
        bc = BadConsequence.newSpecificTreasures(@text, 0, visible, hidden)
      end
    end
    
    bc
  end
 
  
  
  def arrayToString(array)
    texto = " "
    
    array.each do |i| 
      texto += (i.to_s + " ")
     end
     texto
  end
 
  def to_s
      " " +@text+
       "\n\t\tNiveles que pierdes: " +@levels.to_s+
       "\n\t\tNº de tesoros ocultos: "+@nHiddenTreasures.to_s+
       "\n\t\tNº de tesoros visibles: " +@nVisibleTreasures.to_s+
       "\n\t\tMuerte: "+@death.to_s+
       "\n\t\tTesoros ocultos: "+arrayToString(@specificHiddenTreasures)+
       "\n\t\tTesoros visibles: "+arrayToString(@specificVisibleTreasures)
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
