# coding: utf-8

module Model
  class BadConsequenceTypeTreasures < BadConsequence
    def initialize(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
      #super(aText, someLevels, 0, 0, someSpecificVisibleTreasures, someHiddenTreasures,false)
      @text = aText
      @levels = someLevels
      @nVisibleTreasures = 0
      @nHiddenTreasures = 0
      @specificHiddenTreasures  = someSpecificVisibleTreasures
      @specificVisibleTreasures = someSpecificHiddenTreasures
      @death = false
    end
  
    #Devuelve true cuando el mal rollo está vacío. Eso significa que el conjunto de
    #atributos del mal rollo indican que no hay mal rollo que cumplir.
    def isEmpty()
      if  ((@specificHiddenTreasures.empty?) && (@specificVisibleTreasures.empty?) && (@levels == 0))
        respuesta = true
      else
        respuesta = false    
      end
      respuesta
    end
  
    #Actualiza el mal rollo (que tiene que cumplir el jugador) basándose en el hecho de que el
    #jugador se descarta del tesoro visible t.
    def substractVisibleTreasure(t) # (t : Treasure) : void
   
      substract = nil
      @specificVisibleTreasures.each do |i|
        if(i == t.type)
          substract = i
        end
      end
      if substract != nil
        @specificVisibleTreasures.delete(substract)
      end
    end
  
    #Actualiza el mal rollo (que tiene que cumplir el jugador) basándose en el hecho de que el
    #jugador se descarta del tesoro oculto t.
    def substractHiddenTreasure(t)
    
      substract= nil
      @specificHiddenTreasures.each do |i|
        if(i == t.type)
          substract = i
        end
      end
      if substract != nil
        @specificHiddenTreasures.delete(substract)
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
      
      bc = BadConsequenceTypeTreasures.new(@text, 0, visible, hidden)
    end
    
    def to_s
      "Esto es un mal rollo con el siguiente contenido\n" +@text+
        "\n\t\tNiveles que pierdes: " +@levels.to_s+
        "\n\t\tTesoros ocultos: "+arrayToString(@specificHiddenTreasures)+
        "\n\t\tTesoros visibles: "+arrayToString(@specificVisibleTreasures)
    end
  end
end
