# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'monster'
require_relative 'bad_consequence'
require_relative 'prize'
require_relative 'treasure_kind'

#def initializeMonstruos(max)
    # Array con las cartas de los monstruos
    monstruos = Array.new    
    
    # 3 Byakhees de bonanza
    badConsequence = BadConsequence.new("Pierdes tu armadura visible y" + 
                                        "otra oculta.", 0, 
                                        [TreasureKind.ARMOR], 
                                        [TreasureKind.ARMOR])
    prize = Prize.new(2, 1)
    # Añade un nuevo monstruo al final del array
    monstruos << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize)
  
=begin
    # Chibithulhu
    badConsequence = BadConsequence.new("Embobados con el lindo" +
                                        "primigenio te descartas de tu casco" +
                                        "visible.", 0, 
                                        [TreasureKind.HELMET], 
                                        Array.new)
    prize = Prize.new(1, 1)
    monstruos << Monster.new("Chibithulhu", 2, badConsequence, prize)
  
  
    # El sopor de Dunwich
    badConsequence = BadConsequence.new("El primordial bostezo contaguioso." +
                                        "Pierdes el calzado visible.", 0, 
                                        [TreasureKind.HELMET], 
                                        Array.new)
    prize = Prize.new(1,1)
    monstruos << Monster.new("El sopor de Dunwich", 2, badConsequence, prize)
  
    
    # Ángeles de la noche ibicenca
    badConsequence = BadConsequence.new("Te atrapan para llevarte de fiesta" +
                                        "y te dejan car en mitad del vuelo." +
                                        "Descarta 1 mano visible y 1 mano oculta.",
                                        0, 
                                        [TreasureKind.ONEHAND], 
                                        [TreasureKind.ONEHAND])
    prize = Prize.new(4,1)
    monstruos << Monster.new("Ángeles de la noche ibicenca", 14, badConsequence, prize)
  
    
    # El gorrón en el umbral
    badConsequence = BadConsequence.new("Pierdes todos tus tesores visibles.", 0, 
                                        max, 0)
    prize = Prize.new(3,1)
    monstruos << Monster.new("El gorrón en el umbral", 10, badConsequence, prize)
  
    
    # H.P. Munchcraft
    badConsequence = BadConsequence.new("Pierdes la armadura visible.", 0,
                                        [TreasureKind.ARMOR], 
                                        Array.new)
    prize = Prize.new(2,1)
    monstruos << Monster.new("H.P. Munchcraft", 6, badConsequence, prize)
  
    
    # Bichgooth
    badConsequence = BadConsequence.new("Sientes bichos bajo la ropa. " +
                                        "Descarta la armadura visible.", 0, 
                                        [TreasureKind.ARMOR], 
                                        Array.new)
    prize = Prize.new(1,1)
    monstruos << Monster.new("Bichgooth", 2, badConsequence, prize)
  
    
    # El rey de rosa
    badConsequence = BadConsequence.new("Pierdes 5 niveles y 3 tesoros visibles.",
                                        5, 3, 0)
    prize = Prize.new(4,2)
    monstruos << Monster.new("El rey de rosa", 13, badConsequence, prize)
  
    
    # La que redacta en las tinieblas
    badConsequence = BadConsequence.new("Toses los pulmones y pierdes 2 niveles",
                                        2, 0, 0)
    prize = Prize.new(1,1)
    monstruos << Monster.new("La que redacta en las tinieblas", 2, 
                              badConsequence, prize)
  
    
    return monstruos
  end
=end
  
puts monstruos.toString

