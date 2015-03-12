# coding: utf-8 

class CartasMonstruos
  def initialize
    @@monstruos = Array.new(0, Monster)
    
    
    # 3 Byakhees de bonanza
    badConsequence = BadConsequence.new("Pierdes tu armadura visible y" + 
                                        "otra oculta.", 0, 
                                        [TreasureKind.ARMOR], 
                                        [TreasureKind.ARMOR])
    prize = Prize.new(2, 1)
    @@monstruos << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize)
  
  
    # Chibithulhu
    badConsequence = BadConsequence.new("Embobados con el lindo" +
                                        "primigenio te descartas de tu casco" +
                                        "visible.", 0, 
                                        [TreasureKind.HELMET], 
                                        Array.new)
    prize = Prize.new(1, 1)
    @monstruos << Monster.new("Chibithulhu", 2, badConsequence, prize)
  
  
    # El sopor de Dunwich
    badConsequence = BadConsequence.new("El primordial bostezo contaguioso." +
                                        "Pierdes el calzado visible.", 0, 
                                        [TreasureKind.HELMET], 
                                        Array.new)
    prize = Prize.new(1,1)
    @monstruos << Monster.new("El sopor de Dunwich", 2, badConsequence, prize)
  
    
    # Ángeles de la noche ibicenca
    badConsequence = BadConsequence.new("Te atrapan para llevarte de fiesta" +
                                        "y te dejan car en mitad del vuelo." +
                                        "Descarta 1 mano visible y 1 mano oculta.",
                                        0, 
                                        [TreasureKind.ONEHAND], 
                                        [TreasureKind.ONEHAND])
    prize = Prize.new(4,1)
    @monstruos << Monster.new("Ángeles de la noche ibicenca", 14, badConsequence, prize)
  
    
    # El gorrón en el umbral
    badConsequence = BadConsequence.new("Pierdes todos tus tesores visibles.", 0, 
                                        Integer::MAX, 0)
    prize = Prize.new(3,1)
    @monstruos << Monster.new("El gorrón en el umbral", 10, badConsequence, prize)
  
    
    # H.P. Munchcraft
    badConsequence = BadConsequence.new("Pierdes la armadura visible.", 0, 
                                        [TreasureKind.ARMOR], 
                                        Array.new)
    prize = Prize.new(2,1)
    @monstruos << Monster.new("H.P. Munchcraft", 6, badConsequence, prize)
  
    
    # Bichgooth
    badConsequence = BadConsequence.new("Sientes bichos bajo la ropa. " +
                                        "Descarta la armadura visible.", 0, 
                                        [TreasureKind.ARMOR], 
                                        Array.new)
    prize = Prize.new(1,1)
    @monstruos << Monster.new("Bichgooth", 2, badConsequence, prize)
  
    
    # El rey de rosa
    badConsequence = BadConsequence.new("Pierdes 5 niveles y 3 tesoros visibles.",
                                        5, 3, 0)
    prize = Prize.new(4,2)
    @monstruos << Monster.new("El rey de rosa", 13, badConsequence, prize)
  
    
    # La que redacta en las tinieblas
    badConsequence = BadConsequence.new("Toses los pulmones y pierdes 2 niveles",
                                        2, 0, 0)
    prize = Prize.new(1,1)
    @monstruos << Monster.new("La que redacta en las tinieblas", 2, 
                              badConsequence, prize)
  
  
    #Los hondos
    badConsequence = BadConsequence.new("Estos @monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto",1)
    prize = Prize.new(2,1)
    @monstruos << Monster.new("Los hondos", 8 ,badConsequence,prize)
    
    #Semillas Cthulhu
    badConsequence = BadConsequence.new("Pierdes dos niveles y dos tesoros ocultos", 2, 0, 2)
    prize = Prize.new(2,1)
    @monstruos << Monster.new("Semillas Cthulhu", 4,badConsequence, prize)
   
   
   #Dameargo
   badConsequence = BadConsequence.new("Te intentas escaquear. Pierdes una mano visible", 0, 1, 0)
   prize = Prize.new(2,1)
   @monstruos << Monster.new("Dameargo", 1,badConsequence, prize)

    #Pollipólipo volante
    badConsequence = BadConsequence.new("Da mucho asquito. Pierdes tres niveles", 3, 0, 0)
    prize = Prize.new(1,1)
    @monstruos << Monster.new("Pollipólipo volante", 3,badConsequence, prize)
    
    #Yskhtihyssq-Goth
    badConsequence = BadConsequence.new("No le hace gracia que pronuncien mal su nombre. Estas muerto", 1)
    prize = Prize.new(3,1)
    @monstruos << Monster.new("Yskhtihyssq-Goth", 12,badConsequence, prize)
    
    
    #Familia feliz
    badConsequence = BadConsequence.new("La familia te atrapa. Estas muerto", 1)
    prize = Prize.new(4,1)
    @monstruos << Monster.new("Familia feliz", 1,badConsequence, prize)

    #Faltan: de la segunda carilla están hasta los 6 primeros.
  end
  
  
  #Mostrar todos los @monstruos que tengan un nivel de combate superior a 10.
  def nivelSuperiorDiez
    lista_monstruos = Array.new(0,Monster)
    for @monstruos in 0..@monstruos.size do
      if monstruos.combatLevel > 10
        lista_monstruos >> monstruos
      end
      
    end
    lista_monstruos
  end
  
  #Mostrar todos los @monstruos que tengan un mal rollo que implique sólo pérdida de niveles.
  def soloPierdesNiveles 
    lista_monstruos = Array.new(0,Monster)
    
    for @monstruos in 0 .. @monstruos.size do
      if monstruos.bc.level > 0 && monstruos.bc.nHiddenTreasures == 0 && monstruos.bc.nVisibleTreasures == 0 && monstruos.bc.death == 0
        lista_monstruos >> monstruos
      end
    end
  end
  
end
