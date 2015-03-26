# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'

class Dice
  include Singleton

=begin
−instance : Dice = null
−Dice()
=end
  def initialize
    
  end
  
  
  #Genera un número aleatorio entre 1 y 6.
  def nextNumber()
    num = rand(5) +1
    
    num
  end
end

=begin
for i in 0..5
  puts Dice.instance.nextNumber()
end
=end