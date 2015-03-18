# encoding: utf-8

require_relative 'monster'
require_relative 'bad_consequence'
require_relative 'prize'
require_relative 'treasure_kind'
require_relative 'cartas_monstruos'

monstruos = CartasMonstruos.new


array1 = Array.new(0, Monster)
array2 = Array.new(0,Monster)
array3 = Array.new(0,Monster)
array4 = Array.new(0,Monster)

array1 = monstruos.nivelSuperiorDiez
array2 = monstruos.soloPierdesNiveles

array3 = monstruos.ganaNivelSuperiorUno
array4 = monstruos.pierdeOnehand


puts monstruos.to_s(array1)
#puts array2.to_s
#puts array3.to_s
#puts array4.to_s
