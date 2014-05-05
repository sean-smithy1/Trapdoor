class Character

attr_reader :name, :race, :prof, :ac

  def initialize (args)
    @name = args[:name]
    @race = args[:race]
    @prof =args[:prof]
    @hp=args[:current_hp]
    @ac=args[:current_ac]
    @stats=args[:stats] #of str, int, dex, wis con, char
  end

  def attack(char)
    # weapon
    # strength
    # dex
    # experience
  end

  def defend(attack_rating)
    # - for ac
    # +/- for dex (below 13 extra damage)
    # - experience
  end

  def health
    @hp
  end

  def health(points)
    # + heal or - damage
    @hp+points
  end

  def inventory
    #Load inventory. Used by Attack and Defence in their calculations

  end
end

class Player < Character
  def initialize(args)
    super(args)
    @weapon="Sword"
    @armour="Plate"
  end
end

class Monster < Character
  def initialize(args)
    super(args)
    @weapon="Claws"
    @armour="Scrap"
  end
end
