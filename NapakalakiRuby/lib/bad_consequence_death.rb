# coding: utf-8

require_relative 'bad_consequence'
require_relative 'bad_consequence_num_treasures'
require_relative 'bad_consequence_type_treasures'
require_relative 'treasure'

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
      "Esto es un mal rollo con el siguiente contenido\n" +@text+
        "\n\t\tNiveles que pierdes: " +@levels.to_s+
        "\n\t\tNº de tesoros ocultos: "+@nHiddenTreasures.to_s+
        "\n\t\tNº de tesoros ocultos: "+@nHiddenTreasures.to_s+
        "\n\t\tMuerte: "+@death.to_s
    end
  end

  
#PRUEBA BADCONSEQUENCE
# 
#  bc1 = BadConsequenceDeath.new("muerte");
#  bc2 = BadConsequenceNumTreasures.new("numero",0,0,0);
#  bc3 = BadConsequenceTypeTreasures.new("tipo",0,Array.new, Array.new);
#  aux = BadConsequenceDeath.new("aux");
#
#  aux = bc2;
#  bc2= bc1;
#  bc1=aux;
#       
#  aux= bc3;
#  bc3 = bc2;
#  bc2=aux;
#  bc2=bc1;
#  
#  v = Treasure.new("s", 2,0,0,[TreasureKind::ARMOR])
#  h = Treasure.new("s", 0,0,0,[TreasureKind::ARMOR])
#  hidden = Array.new
#  hidden << h
#  visible = Array.new
#  visible << v
#  
#  bc1.adjustToFitTreasureLists(visible,hidden)
#  bc2.adjustToFitTreasureLists(visible,hidden)
#  bc3.adjustToFitTreasureLists(visible,hidden)
#        
#  puts bc1.isEmpty()
#  puts bc2.isEmpty()
#  puts bc3.isEmpty()
#  puts "Prueba BC"

end