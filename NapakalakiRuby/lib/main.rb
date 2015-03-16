# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'monster'
require_relative 'bad_consequence'
require_relative 'prize'
require_relative 'treasure_kind'
require_relative 'cartas_monstruos'


monstruos = CartasMonstruos.new

array1 = Array.new(0,Monster)
array2 = Array.new(0,Monster)
array3 = Array.new(0,Monster)
array4 = Array.new(0,Monster)

array1 = monstruos.nivelSuperiorDiez
array2 = monstruos.soloPierdesNiveles

#array3 = 
#array4 = 

#System.out.println(array1.to_s)
#System.out.println(array2.to_s)
#System.out.println(array3.to_s)
#System.out.println(array4.to_s)
