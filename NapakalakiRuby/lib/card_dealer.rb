# coding: utf-8 
require 'singleton'
require_relative 'treasure'
require_relative 'monster'
require_relative 'bad_consequence'
require_relative 'prize'
module Model
class CardDealer
  
  include Singleton
  
  private
  def initialize
    initCards
  end
  
  #Inicializa el mazo de cartas de tesoros
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
  
  #Inicializa el mazo de cartas de monstruos
  def initMonsterCardDeck()
    @unusedMonsters = Array.new


    # 3 Byakhees de bonanza
    # El primer array de badConsequence es specificVisibleTreasures,
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequenceTypeTreasures.new("Pierdes tu armadura visible y" +
                                        "otra oculta",0,
                                        [TreasureKind::ARMOR],
                                        [TreasureKind::ARMOR])
    prize = Prize.new(2, 1)
    @unusedMonsters << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize,0)


    # Chibithulhu
    badConsequence = BadConsequenceTypeTreasures.new("Embobados con el lindo"  +
                                                        "primigenio te descartas de tu casco" +
                                                        "visible",0,
                                                        [TreasureKind::HELMET],
                                                        Array.new)
    prize = Prize.new(1, 1)
    @unusedMonsters << Monster.new("Chibithulhu", 2, badConsequence, prize,0)


    # El sopor de Dunwich
    badConsequence = BadConsequenceTypeTreasures.new("El primordial bostezo contaguioso." +
                                                        "Pierdes el calzado visible",0,
                                                        [TreasureKind::HELMET],
                                                        Array.new)
    prize = Prize.new(1,1)
    @unusedMonsters << Monster.new("El sopor de Dunwich", 2, badConsequence, prize,0)


    # Ángeles de la noche ibicenca
    badConsequence = BadConsequenceTypeTreasures.new("Te atrapan para llevarte de fiesta" +
                                                        "y te dejan car en mitad del vuelo." +
                                                        "Descarta 1 mano visible y 1 mano oculta",0,
                                                        [TreasureKind::ONEHAND],
                                                        [TreasureKind::ONEHAND])
    prize = Prize.new(4,1)
    @unusedMonsters << Monster.new("Ángeles de la noche ibicenca", 14, badConsequence, prize,0)


    # El gorrón en el umbral
    badConsequence = BadConsequenceNumTreasures.new("Pierdes todos tus tesores visibles.", 1,
                                                        4, 0)
    prize = Prize.new(3,1)
    @unusedMonsters << Monster.new("El gorrón en el umbral", 10, badConsequence, prize,0)


    # H.P. Munchcraft
    badConsequence = BadConsequenceTypeTreasures.new("Pierdes la armadura visible.",
                                                        0, [TreasureKind::ARMOR],
                                                        Array.new)
    prize = Prize.new(2,1)
    @unusedMonsters << Monster.new("H.P. Munchcraft", 6, badConsequence, prize,0)


    # Bichgooth
    badConsequence = BadConsequenceTypeTreasures.new("Sientes bichos bajo la ropa." +
                                                        "Descarta la armadura visible",0,
                                                        [TreasureKind::ARMOR],
                                                        Array.new)
    prize = Prize.new(1,1)
    @unusedMonsters << Monster.new("Bichgooth", 2, badConsequence, prize,0)


    # El rey de rosa
    badConsequence = BadConsequenceNumTreasures.new("Pierdes 5 niveles y 3 tesoros visibles",
                                                        5, 3, 0)
    prize = Prize.new(4,2)
    @unusedMonsters << Monster.new("El rey de rosa", 13, badConsequence, prize,0)


    # La que redacta en las tinieblas
    badConsequence = BadConsequenceNumTreasures.new("Toses los pulmones y"+
                                                        "pierdes 2 niveles",
                                                        2, 0, 0)
    prize = Prize.new(1,1)
    @unusedMonsters << Monster.new("La que redacta en las tinieblas", 2,
                              badConsequence, prize,0)


    #Los hondos
    badConsequence = BadConsequenceDeath.new("Estos @monstruos resultan "+
                                            "bastante superficiales y te aburren "+
                                            "mortalmente. Estas muerto")
    prize = Prize.new(2,1)
    @unusedMonsters << Monster.new("Los hondos", 8 ,badConsequence,prize,0)

    #Semillas Cthulhu
    badConsequence = BadConsequenceNumTreasures.new("Pierdes 2 niveles y 2 "+
                                                        "tesoros ocultos", 2, 0, 2)
    prize = Prize.new(2,1)
    @unusedMonsters << Monster.new("Semillas Cthulhu", 4, badConsequence, prize,0)

    #Dameargo
    badConsequence = BadConsequenceTypeTreasures.new("Te intentas escaquear."+
                                                        " Pierdes una mano visible",0,
                                                        [TreasureKind::ONEHAND],
                                                        Array.new)
    prize = Prize.new(2,1)
    @unusedMonsters << Monster.new("Dameargo", 1, badConsequence, prize,0)

    #Pollipólipo volante
    badConsequence = BadConsequenceNumTreasures.new("Da mucho asquito."+
                                                        " Pierdes 3 niveles",
                                                        3, 0, 0)
    prize = Prize.new(1,1)
    @unusedMonsters << Monster.new("Pollipólipo volante", 3, badConsequence, prize,0)

    #Yskhtihyssq-Goth
    badConsequence = BadConsequenceDeath.new("No le hace gracia que"+
                                            " pronuncien mal su nombre. Estas"+
                                            " muerto")
    prize = Prize.new(3,1)
    @unusedMonsters << Monster.new("Yskhtihyssq-Goth", 12, badConsequence, prize,0)


    #Familia feliz
    badConsequence = BadConsequenceDeath.new("La familia te atrapa."+
                                            "Estas muerto")
    prize = Prize.new(4,1)
    @unusedMonsters << Monster.new("Familia feliz", 1, badConsequence, prize,0)
    
    #Roboggoth
    badConsequence = BadConsequenceTypeTreasures.new("La quinta directiva primaria te obliga a perder 2 niveles"+
                                                         "y un tesoro 2 manos visible", 2,[TreasureKind::BOTHHANDS], Array.new)
    prize = Prize.new(2, 1)
    @unusedMonsters << Monster.new("Roboggoth", 8, badConsequence, prize,0)
        
    #El espia
    badConsequence = BadConsequenceTypeTreasures.new("Te asusta en la noche.Pierdes un casco visible",0,
                                                        [TreasureKind::HELMET], Array.new)
    prize = Prize.new(1, 1)
    @unusedMonsters << Monster.new("El espía", 5, badConsequence, prize,0)
    
    #El lenguas
    badConsequence = BadConsequenceNumTreasures.new("Menudo susto te llevas. Pierdes 2 niveles y"+
                                                         "5 tesoros visibles", 2, 5, 0)
    prize = Prize.new(1, 1)
    @unusedMonsters << Monster.new("El lenguas", 20, badConsequence, prize,0)
    
    
    #Bicefalo
    badConsequence = BadConsequenceNumTreasures.new("Te faltan manos para tanta cabeza. Pierdes 3 niveles"+
                                                         "y tus tesoros visibles de las manos", 3, 4, 0)
    prize = Prize.new(1,1)
    @unusedMonsters << Monster.new("Bicefalo", 20, badConsequence, prize,0)
    
    #
    #SECTARIOS
    
    #El mal indecible impronunciable
    badConsequence = BadConsequenceTypeTreasures.new("Pierdes una mano visible", 0,
                    [TreasureKind::ONEHAND], Array.new)
    prize = Prize.new(3,1)
    @unusedMonsters << Monster.new("El mal indecible impronunciable", 10, badConsequence, prize, -2)
        
    #Testigos oculares
    badConsequence = BadConsequenceNumTreasures.new("Pierdes tus tesoros visibles. Jajaja", 0,7,0)
    prize = Prize.new(2,1)
    @unusedMonsters << Monster.new("Testigos oculares", 6, badConsequence, prize,2)
        
    #El gran Cthulhu
        badConsequence = BadConsequenceDeath.new("Hoy no es tu dia de suerte, mueres.")
        prize = Prize.new(2,5)
        @unusedMonsters << Monster.new("El gran Cthulhu", 20, badConsequence, prize,4)
        
        #Serpiente político
        badConsequence = BadConsequenceNumTreasures.new("Tu gobierno te recorta dos niveles.", 2,0,0)
        prize = Prize.new(2,1)
        @unusedMonsters << Monster.new("Serpiente político", 8, badConsequence, prize,-2)
        
       #Felpuggoth
        badConsequence = BadConsequenceTypeTreasures.new("Pierdes tu casco y armadura visible.Pierdes tus manos ocultas", 0,
             [TreasureKind::ARMOR, TreasureKind::HELMET], 
             [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::ONEHAND,
              TreasureKind::BOTHHANDS,TreasureKind::BOTHHANDS,TreasureKind::BOTHHANDS,TreasureKind::BOTHHANDS])
        prize = Prize.new(1,1)
        @unusedMonsters << Monster.new("Felpuggoth", 2, badConsequence, prize,5)
        
        #Shoggoth
        badConsequence = BadConsequenceNumTreasures.new("Pierdes dos niveles",2,0,0)
        prize = Prize.new(4,2)
        @unusedMonsters << Monster.new("Shoggoth", 16, badConsequence, prize,-4)
        
        #Lolitaggoth
        badConsequence = BadConsequenceNumTreasures.new("Pintalabios negro. Pierdes dos niveles",2,0,0)
        prize = Prize.new(1,1)
        @unusedMonsters << Monster.new("Lolitaggoth", 2, badConsequence, prize,3)
    
  end
  
  def initCultistCardDeck()
    @unusedCultists = Array.new
    
    @unusedCultists << Cultist.new("Sectario", 1)
    @unusedCultists << Cultist.new("Sectario", 2)
    @unusedCultists << Cultist.new("Sectario", 1)
    @unusedCultists << Cultist.new("Sectario", 2)
    @unusedCultists << Cultist.new("Sectario", 1)
    @unusedCultists << Cultist.new("Sectario", 1)
    
  end
  
  #Baraja el mazo de cartas de tesoros
  def shuffleTreasures()
    @unusedTreasures.shuffle!
  end
  
  #Baraja el mazo de cartas de monstruos
  def shuffleMonsters()
    @unusedMonsters.shuffle!
  end
  
  def shuffleCultists()
    @unusedCultists.shuffle!
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
  
  #Devuelve el siguiente monstruo que hay en el mazo de monstruos (unusedMonters) y lo
  #elimina de él. Si el mazo está vacío, pasa el mazo de descartes (usedMonsters) al mazo
  #de monstruos y lo baraja, dejando el mazo de descartes vacío.
  def nextMonster()
    monster = @unusedMonsters.first()
    @unusedMonsters.delete_at(0)
    giveMonsterBack(monster)
    
    monster
  end
  
  def nextCultist()
    cultist = @unusedCultists.first()
    @unusedCultists.delete_at(0)
    
    cultist
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
    initCultistCardDeck()
    
    shuffleMonsters()
    shuffleTreasures()
    shuffleCultists()
    
    @usedTreasures = Array.new
    @usedMonsters = Array.new
    
  end
  
end

#cartas = CardDealer.instance
#cartas.initCards()
#puts cartas.nextMonster().to_s
#puts cartas.nextMonster().to_s
#puts cartas.nextMonster().to_s
#cartas.nextTreasure()
#puts "Prueba CardDealer"
end

