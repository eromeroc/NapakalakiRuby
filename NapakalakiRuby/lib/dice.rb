
require 'singleton'
module Model
class Dice
  include Singleton

  def initialize
    
  end
  
  #Genera un número aleatorio entre 1 y 6.
  def nextNumber()
    num = rand(6) +1
    
    num
  end
end

#PRUEBA DICE 

=begin
for i in 0..5
  puts Dice.instance.nextNumber()
end
=end
end
