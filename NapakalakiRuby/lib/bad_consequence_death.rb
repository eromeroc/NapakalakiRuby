
module Model


  class BadConsequenceDeath < BadConsequence

    def initialize(aText)
      @text = aText
      @levels = 0
      @nVisibleTreasures = 0
      @nHiddenTreasures = 0
      @specificHiddenTreasures  = Array.new
      @specificVisibleTreasures = Array.new
      @death = true
    end
  
    #Devuelve true cuando el mal rollo está vacío. Eso significa que el conjunto de
    #atributos del mal rollo indican que no hay mal rollo que cumplir.
    def isEmpty()
      if  ((@levels == 0))
        respuesta = true
      else
        respuesta = false    
      end
      respuesta
    end
    
    def to_s
      "Esto es un mal rollo con el siguiente contenido\n"+
        +@text+
        "\n\t\tNiveles que pierdes: " +@levels.to_s+
        "\n\t\tNº de tesoros ocultos: "+@nHiddenTreasures.to_s+
        "\n\t\tNº de tesoros ocultos: "+@nHiddenTreasures.to_s+
        "\n\t\tMuerte: "+@death.to_s
    end
  end

end