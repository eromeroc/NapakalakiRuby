# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
include Singleton

class Dice
=begin
−instance : Dice = null
−Dice()
=end
  def initialize
    
  end
  
  def getInstance()
    Dice.new
  end
  
  def nextNumber()
    #int
    #Genera un número aleatorio entre 1 y 6.
  end
end
