# coding: utf-8 
require 'singleton'
require_relative 'treasure'
require_relative 'monster'
require_relative 'bad_consequence'
require_relative 'prize'

class CardDealer
  
  include Singleton
  
  private
  def initialize
    initCards
  end
  
  
  def initTreasureCardDeck()
    @unusedTreasures = Array.new
    
    #Estructura: Nombre, Piezas de oro, minBonus, maxBonus, TreasureKind::XXXXX
    @unusedTreasures = Array.new
    @unusedTreasures<< Treasure.new("¡Sí mi amo!", 0, 4, 7, TreasureKind::HELMET)
    @unusedTreasures<< Treasure.new("Botas de investigación", 600, 3, 4, TreasureKind::SHOE)
    @unusedTreasures<< Treasure.new("Capucha de Cthulhu", 500, 3, 5, TreasureKind::HELMET)
    @unusedTreasures<< Treasure.new("A prueba de babas", 400, 2, 5, TreasureKind::ARMOR)
    @unusedTreasures<< Treasure.new("Botas de lluvia ácida", 800, 1, 1, TreasureKind::BOTHHANDS)
    @unusedTreasures<< Treasure.new("Casco minero", 400, 2, 4, TreasureKind::HELMET)
    @unusedTreasures<< Treasure.new("Ametralladora Thompson", 600, 4, 8, TreasureKind::BOTHHANDS)
    @unusedTreasures<< Treasure.new("Camiseta de la UGR", 100, 1, 7, TreasureKind::ARMOR)
    @unusedTreasures<< Treasure.new("Clavo de rail ferroviario", 400, 3, 6, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("Cuchillo de sushi arcano", 300, 2, 3, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("Fez alópodo", 700, 3, 5, TreasureKind::HELMET)
    @unusedTreasures<< Treasure.new("Hacha prehistórica", 500, 2, 5, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("El aparato del Pr. Tesla", 900, 4, 8, TreasureKind::ARMOR)
    @unusedTreasures<< Treasure.new("Gaita", 500, 4, 5, TreasureKind::BOTHHANDS)
    @unusedTreasures<< Treasure.new("Insecticida", 300, 2, 3, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("Escopeta de 3 cañones", 700, 4, 6, TreasureKind::BOTHHANDS)
    @unusedTreasures<< Treasure.new("Garabato místico", 300, 2, 2, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("La fuerza de Mr. T", 1000, 0, 0, TreasureKind::NECKLACE) 
    @unusedTreasures<< Treasure.new("La rebeca metálica", 400, 2, 3, TreasureKind::ARMOR)
    @unusedTreasures<< Treasure.new("Mazo de los antiguos", 200, 3, 4, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("Necro-playboycon", 300, 3, 5, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("Lanzallamas", 800, 4, 8, TreasureKind::BOTHHANDS)
    @unusedTreasures<< Treasure.new("Necro-comicón", 100, 1, 1, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("Necronomicón", 800, 5, 7, TreasureKind::BOTHHANDS)
    @unusedTreasures<< Treasure.new("Linterna a 2 manos", 400, 3, 6, TreasureKind::BOTHHANDS)
    @unusedTreasures<< Treasure.new("Necro-gnomicón", 200, 2, 4, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("Necrotelecom", 300, 2, 3, TreasureKind::HELMET)
    @unusedTreasures<< Treasure.new("Porra preternatural", 200, 2, 3, TreasureKind::ONEHAND)
    @unusedTreasures<< Treasure.new("Tentáculo de pega", 200, 0, 1, TreasureKind::HELMET)
    @unusedTreasures<< Treasure.new("Zapato deja-amigos", 500, 0, 1, TreasureKind::SHOE)
    @unusedTreasures<< Treasure.new("Shogulador", 600, 1, 1, TreasureKind::BOTHHANDS)
    @unusedTreasures<< Treasure.new("Varita de atizamiento", 400, 3, 4, TreasureKind::ONEHAND)   
  end
  
  def initMonsterCardDeck()
    @unusedMonsters = Array.new


    # 3 Byakhees de bonanza
    # El primer array de badConsequence es specificVisibleTreasures,
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("Pierdes tu armadura visible y\n" +
                                        "otra oculta\n",0,
                                        [TreasureKind::ARMOR],
                                        [TreasureKind::ARMOR])
    prize = Prize.new(2, 1)
    @unusedMonsters << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize)


    # Chibithulhu
    badConsequence = BadConsequence.newSpecificTreasures("Embobados con el lindo\n" +
                                                        "primigenio te descartas de tu casco\n" +
                                                        "visible\n",0,
                                                        [TreasureKind::HELMET],
                                                        Array.new)
    prize = Prize.new(1, 1)
    @unusedMonsters << Monster.new("Chibithulhu", 2, badConsequence, prize)


    # El sopor de Dunwich
    badConsequence = BadConsequence.newSpecificTreasures("El primordial bostezo contaguioso.\n" +
                                                        "Pierdes el calzado visible\n",0,
                                                        [TreasureKind::HELMET],
                                                        Array.new)
    prize = Prize.new(1,1)
    @unusedMonsters << Monster.new("El sopor de Dunwich", 2, badConsequence, prize)


    # Ángeles de la noche ibicenca
    badConsequence = BadConsequence.newSpecificTreasures("Te atrapan para llevarte de fiesta\n" +
                                                        "y te dejan car en mitad del vuelo.\n" +
                                                        "Descarta 1 mano visible y 1 mano oculta\n",0,
                                                        [TreasureKind::ONEHAND],
                                                        [TreasureKind::ONEHAND])
    prize = Prize.new(4,1)
    @unusedMonsters << Monster.new("Ángeles de la noche ibicenca", 14, badConsequence, prize)


    # El gorrón en el umbral
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes todos tus tesores visibles.\n", 1,
                                                        4, 0)
    prize = Prize.new(3,1)
    @unusedMonsters << Monster.new("El gorrón en el umbral", 10, badConsequence, prize)


    # H.P. Munchcraft
    badConsequence = BadConsequence.newSpecificTreasures("Pierdes la armadura visible.\n",
                                                        0, [TreasureKind::ARMOR],
                                                        Array.new)
    prize = Prize.new(2,1)
    @unusedMonsters << Monster.new("H.P. Munchcraft", 6, badConsequence, prize)


    # Bichgooth
    badConsequence = BadConsequence.newSpecificTreasures("Sientes bichos bajo la ropa.\n" +
                                                        "Descarta la armadura visible\n",0,
                                                        [TreasureKind::ARMOR],
                                                        Array.new)
    prize = Prize.new(1,1)
    @unusedMonsters << Monster.new("Bichgooth", 2, badConsequence, prize)


    # El rey de rosa
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles\n",
                                                        5, 3, 0)
    prize = Prize.new(4,2)
    @unusedMonsters << Monster.new("El rey de rosa", 13, badConsequence, prize)


    # La que redacta en las tinieblas
    badConsequence = BadConsequence.newNumberOfTreasures("Toses los pulmones y\n"+
                                                        "pierdes 2 niveles\n",
                                                        2, 0, 0)
    prize = Prize.new(1,1)
    @unusedMonsters << Monster.new("La que redacta en las tinieblas\n", 2,
                              badConsequence, prize)


    #Los hondos
    badConsequence = BadConsequence.newDeath("Estos @monstruos resultan \n"+
                                            "bastante superficiales y te aburren \n"+
                                            "mortalmente. Estas muerto\n")
    prize = Prize.new(2,1)
    @unusedMonsters << Monster.new("Los hondos", 8 ,badConsequence,prize)

    #Semillas Cthulhu
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes 2 niveles y 2 \n"+
                                                        "tesoros ocultos\n", 2, 0, 2)
    prize = Prize.new(2,1)
    @unusedMonsters << Monster.new("Semillas Cthulhu", 4, badConsequence, prize)

    #Dameargo
    badConsequence = BadConsequence.newSpecificTreasures("Te intentas escaquear.\n"+
                                                        " Pierdes una mano visible\n",0,
                                                        [TreasureKind::ONEHAND],
                                                        Array.new)
    prize = Prize.new(2,1)
    @unusedMonsters << Monster.new("Dameargo", 1, badConsequence, prize)

    #Pollipólipo volante
    badConsequence = BadConsequence.newNumberOfTreasures("Da mucho asquito.\n"+
                                                        " Pierdes 3 niveles\n",
                                                        3, 0, 0)
    prize = Prize.new(1,1)
    @unusedMonsters << Monster.new("Pollipólipo volante", 3, badConsequence, prize)

    #Yskhtihyssq-Goth
    badConsequence = BadConsequence.newDeath("No le hace gracia que\n"+
                                            " pronuncien mal su nombre. Estas\n"+
                                            " muerto\n")
    prize = Prize.new(3,1)
    @unusedMonsters << Monster.new("Yskhtihyssq-Goth", 12, badConsequence, prize)


    #Familia feliz
    badConsequence = BadConsequence.newDeath("La familia te atrapa.\n"+
                                            "Estas muerto\n")
    prize = Prize.new(4,1)
    @unusedMonsters << Monster.new("Familia feliz", 1, badConsequence, prize)
    
    #Roboggoth
    badConsequence = BadConsequence.newSpecificTreasures("La quinta directiva primaria te obliga a perder 2 niveles"+
                                                         "y un tesoro 2 manos visible", 2,[TreasureKind::BOTHHANDS], Array.new)
    prize = Prize.new(2, 1)
    @unusedMonsters << Monster.new("Roboggoth", 8, badConsequence, prize)
        
    #El espia
    badConsequence = BadConsequence.newSpecificTreasures("Te asusta en la noche.Pierdes un casco visible",0,
                                                        [TreasureKind::HELMET], Array.new)
    prize = Prize.new(1, 1)
    @unusedMonsters << Monster.new("El espía", 5, badConsequence, prize)
    
    #El lenguas
    badConsequence = BadConsequence.newNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y"+
                                                         "5 tesoros visibles", 2, 5, 0)
    prize = Prize.new(1, 1)
    @unusedMonsters << Monster.new("El lenguas", 20, badConsequence, prize)
    
    
    #Bicefalo
    badConsequence = BadConsequence.newNumberOfTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles"+
                                                         "y tus tesoros visibles de las manos", 3, 4, 0)
    prize = Prize.new(1,1)
    @unusedMonsters << Monster.new("Bicefalo", 20, badConsequence, prize)
    
  end
  
  def shuffleTreasures()
    @unusedTreasures.shuffle!
  end
  
  def shuffleMonsters()
    @unusedMonsters.shuffle!
  end
  
  
  public
  #Devuelve el siguiente tesoro que hay en el mazo de tesoros (unusedTreasures) y lo
#elimina de él. Si el mazo está vacío, pasa el mazo de descartes (usedTreasures) al mazo
#de tesoros y lo baraja, dejando el mazo de descartes vacío.
  def nextTreasure()
    treasure = @unusedTreasures.first()
    giveTreasureBack(treasure)
    @unusedTreasures.delete_at(0)
    
    treasure
  end
  
  #Igual que la anterior pero con el mazo de monstruos.
  def nextMonster()
    monster = @unusedTreasures.first()
    @unusedTreasures.delete_at(0)
    giveMonsterBack(monster)
    
    monster
  end
  
  
  #Introduce en el mazo de descartes de tesoros el tesoro t
  def giveTreasureBack(t)    #t : Treasure
    @usedTreasures << t
  end
  
  
  #Introduce en el mazo de descartes de monstruos el mosntruo m
  def giveMonsterBack(m)     #m : Monster
    @usedMonsters << m
  end
  
  #Inicializa las dos barajas de cartas: monstruos y tesoros
  def initCards()
    initTreasureCardDeck()
    initMonsterCardDeck()
    
    @usedTreasures = Array.new
    @usedMonsters = Array.new
    
  end
  
end

cartas = CardDealer.instance
cartas.initCards()
cartas.nextMonster()
cartas.nextTreasure()
puts "Prueba CardDealer"
