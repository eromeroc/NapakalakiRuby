# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'monster'
require_relative 'bad_consequence'
require_relative 'prize'
require_relative 'treasure_kind'
require_relative 'cartas_monstruos'

monstruos = CartasMonstruos.new

aux1 = Array.new(0,Monster)
aux2 = Array.new(0,Monster)
aux3 = Array.new(0,Monster)
aux4 = Array.new(0,Monster)

aux1 = monstruos.nivelSuperiorDiez
aux2 = monstruos.soloPierdesNiveles


