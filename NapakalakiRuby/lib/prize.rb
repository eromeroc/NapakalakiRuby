module Model
class Prize
    attr_reader :treasures
    attr_reader :levels
    
    def initialize(t, l)
        @treasures = t
        @levels = l
    end
    
    def to_s
        "\n\t\tTesoros: #{@treasures}"+
        "\n\t\tNiveles: #{@levels}"
      
    end
end
end