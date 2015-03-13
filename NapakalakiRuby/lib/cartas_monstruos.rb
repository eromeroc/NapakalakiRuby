# coding: utf-8 

class CartasMonstruos
  def initialize
    @monstruos = Array.new(0, Monster)    
    
    
    # 3 Byakhees de bonanza
    badConsequence = BadConsequence.newSpecificTreasures("Pierdes tu armadura visible y otra oculta.",
                                                         0,[TreasureKind::ARMOR],[TreasureKind::ARMOR])
    prize = Prize.new(2, 1)
    @monstruos << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize)  
  
    
    # Chibithulhu
    badConsequence = BadConsequence.newSpecificTreasures("Embobados con el lindoprimigenio te descartas de"+
                                                         "tu casco visible.", 0,[TreasureKind::HELMET],
                                                         Array.new)
    prize = Prize.new(1, 1)
    @monstruos << Monster.new("Chibithulhu", 2, badConsequence, prize)
   
    
    # El sopor de Dunwich
    badConsequence = BadConsequence.newSpecificTreasures("El primordial bostezo contaguioso."+
                                                         "Pierdes el calzado visible.",0,
                                                         [TreasureKind::HELMET],Array.new)
    prize = Prize.new(1,1)
    @monstruos << Monster.new("El sopor de Dunwich", 2, badConsequence, prize)
     
    
    # Ángeles de la noche ibicenca
    badConsequence = BadConsequence.newSpecificTreasures("Te atrapan para llevarte de fiesta y"+
                                                         "te dejan caer en mitad del vuelo.Descarta"+
                                                         "1 mano visible y 1 mano oculta.",0,
                                                       [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
    prize = Prize.new(4,1)
    @monstruos << Monster.new("Ángeles de la noche ibicenca", 14, badConsequence, prize)  
    
    
    # El gorrón en el umbral
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes todos tus tesores visibles.", 0,
                                                         Integer::MAX, 0)
    prize = Prize.new(3,1)
    @monstruos << Monster.new("El gorrón en el umbral", 10, badConsequence, prize)
      
    
    # H.P. Munchcraft
    badConsequence = BadConsequence.newSpecificTreasures("Pierdes la armadura visible.", 0, 
                                                        [TreasureKind::ARMOR], Array.new)
    prize = Prize.new(2,1)
    @monstruos << Monster.new("H.P. Munchcraft", 6, badConsequence, prize)
    
    
    # Bichgooth
    badConsequence = BadConsequence.newSpecificTreasures("Sientes bichos bajo la ropa. Descarta"+
                                                         "la armadura visible.", 0,[TreasureKind::ARMOR],
                                                         Array.new)
    prize = Prize.new(1,1)
    @monstruos << Monster.new("Bichgooth", 2, badConsequence, prize)
  
    
    # El rey de rosa
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles.",
                                                          5, 3, 0)
    prize = Prize.new(4,2)
    @monstruos << Monster.new("El rey de rosa", 13, badConsequence, prize)
  
    
    # La que redacta en las tinieblas
    badConsequence = BadConsequence.newNumberOfTreasures("Toses los pulmones y pierdes 2 niveles",
                                                        2, 0, 0)
    prize = Prize.new(1,1)
    @monstruos << Monster.new("La que redacta en las tinieblas", 2, badConsequence, prize)
  
  
    #Los hondos
    badConsequence = BadConsequence.newDeath("Estos monstruos resultan bastante superficiales y te aburren"+
                                            "mortalmente. Estas muerto",1)
    prize = Prize.new(2,1)
    @monstruos << Monster.new("Los hondos", 8 ,badConsequence,prize)
    
    
    #Semillas Cthulhu
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes dos niveles y dos tesoros ocultos", 2, 0, 2)
    prize = Prize.new(2,1)
    @monstruos << Monster.new("Semillas Cthulhu", 4,badConsequence, prize)
   
 
    #Dameargo
    badConsequence = BadConsequence.newSpecificTreasures("Te intentas escaquear. Pierdes una mano visible",
                                                          0, [TreasureKind::ONEHAND], Array.new)
    prize = Prize.new(2,1)
    @monstruos << Monster.new("Dameargo", 1,badConsequence, prize)

    
    #Pollipólipo volante
    badConsequence = BadConsequence.newNumberOfTreasures("Da mucho asquito. Pierdes tres niveles", 3, 0, 0)
    prize = Prize.new(1,1)
    @monstruos << Monster.new("Pollipólipo volante", 3,badConsequence, prize)
    
    
    #Yskhtihyssq-Goth
    badConsequence = BadConsequence.newDeath("No le hace gracia que pronuncien mal su nombre. Estas muerto", 1)
    prize = Prize.new(3,1)
    @monstruos << Monster.new("Yskhtihyssq-Goth", 12,badConsequence, prize)
    
    
    #Familia feliz
    badConsequence = BadConsequence.newDeath("La familia te atrapa. Estas muerto", 1)
    prize = Prize.new(4,1)
    @monstruos << Monster.new("Familia feliz", 1,badConsequence, prize)
    
    
    #Roboggoth
    badConsequence = BadConsequence.newSpecificTreasures("La quinta directiva primaria te obliga a perder 2 niveles"+
                                                         "y un tesoro 2 manos visible", 2,[TreasureKind::BOTHHANDS], Array.new)
    prize = Prize.new(2, 1)
    @monstruos << Monster.new("Roboggoth", 8, badConsequence, prize)
    
    
    #El espia
    badConsequence = BadConsequence.newSpecificTreasures("Te asusta en la noche.Pierdes un casco visible",0,
                                                        [TreasureKind::HELMET], Array.new)
    prize = Prize.new(1, 1)
    @monstruos << Monster.new("El espía", 5, badConsequence, prize)
    
    
    #El lenguas
    badConsequence = BadConsequence.newNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y"+
                                                         "5 tesoros visibles", 2, 5, 0)
    prize = Prize.new(1, 1)
    @monstruos << Monster.new("El lenguas", 20, badConsequence, prize)
    
    
    #Bicefalo
    badConsequence = BadConsequence.newNumberOfTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles"+
                                                         "y tus tesoros visibles de las manos", 3, Integer::MAX, 0)
    prize = Prize.new(1,1)
    @monstruos << Monster.new("Bicefalo", 20, badConsequence, prize)
                                                      
  end
  
  
  #Mostrar todos los @monstruos que tengan un nivel de combate superior a 10.
  def nivelSuperiorDiez
    lista_monstruos = Array.new(0,Monster)
    @monstruos.each do |m|
      if monstruos.combatLevel > 10
        lista_monstruos >> monstruos
      end
    end
    lista_monstruos
  end
  
  #Mostrar todos los @monstruos que tengan un mal rollo que implique sólo pérdida de niveles.
  def soloPierdesNiveles 
    lista_monstruos = Array.new(0,Monster)
    
    @monstruos.each do |m|
      if monstruos.bc.level > 0 && monstruos.bc.nHiddenTreasures == 0 && monstruos.bc.nVisibleTreasures == 0 && monstruos.bc.death == 0
        lista_monstruos >> monstruos
      end
    end
    lista_monstruos
  end
  
end
