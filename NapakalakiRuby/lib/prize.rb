
class Prize
    attr_reader :treasures
    attr_reader :levels
    
    def initialize(t, l)
        @treasures = t
        @levels = l
    end
    
    def to_s
        output = "\n\tTesoros: #{@treasures}"+
        "\n\tNiveles: #{@levels}"
      
      output
    end
end
