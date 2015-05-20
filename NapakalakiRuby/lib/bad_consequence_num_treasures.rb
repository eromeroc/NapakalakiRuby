# coding: utf-8

module Model
  class BadConsequenceNumTreasures < BadConsequence
    def initialize (aText, someLevels, someVisibleTreasures, someHiddenTreasures)
      @text = aText
      @levels = someLevels
      @nVisibleTreasures = someVisibleTreasures
      @nHiddenTreasures = someHiddenTreasures
      @specificHiddenTreasures  = Array.new
      @specificVisibleTreasures = Array.new
      @death = false
    end
  
    #Devuelve true cuando el mal rollo está vacío. Eso significa que el conjunto de
    #atributos del mal rollo indican que no hay mal rollo que cumplir.
    def isEmpty()
      if  ((@nVisibleTreasures == 0) && (@nHiddenTreasures == 0) && (@levels == 0))
        respuesta = true
      else
        respuesta = false    
      end
      respuesta
    end
  
    #Actualiza el mal rollo (que tiene que cumplir el jugador) basándose en el hecho de que el
    #jugador se descarta del tesoro visible t.
    def substractVisibleTreasure(t) 
      if(@nVisibleTreasures > 0)
        @nVisibleTreasures = @nVisibleTreasures -1
      end
    end
  
    #Actualiza el mal rollo (que tiene que cumplir el jugador) basándose en el hecho de que el
    #jugador se descarta del tesoro oculto t.
    def substractHiddenTreasure(t) 
      if(@nHiddenTreasures > 0)
        @nHiddenTreasures = @nHiddenTreasures -1
      end
    end
  
    #Recibe como parámetros los tesoros visibles y ocultos de los que dispone el jugador y
    #devuelve un nuevo objeto mal rollo creado a partir del objeto mal rollo que ejecuta este
    #método.
    #El objeto de mal rollo devuelto por adjustToFitTreasureLists solo contendrá listas
    #de tipos de tesoros o cantidades de tesoros de forma que el jugador correspondiente
    #pueda cumplir el mal rollo generado.
    def adjustToFitTreasureLists(v, h) # (v : Treasure[], h : Treasure[]) : BadConsequence
    
      nVisible
      nHidden
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
          
      end
      bc = BadConsequenceNumTreasures.new(@text,0,nVisible, nHidden)
    end
    
    def to_s
      "Esto es un mal rollo con el siguiente contenido\n"+ @text+
        "\n\t\tNiveles que pierdes: " + @levels.to_s+
        "\n\t\tNº de tesoros ocultos: "+ @nHiddenTreasures.to_s+
        "\n\t\tNº de tesoros visibles: " + @nVisibleTreasures.to_s
    end
  end
end
 

