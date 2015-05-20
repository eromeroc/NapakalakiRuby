require_relative 'cultist'

module Model

  if __FILE__ == $0
   sectario = Cultist.new("j1",2);
   puts sectario.getBasicValue()
   puts sectario.getSpecialValue()
  end

end 