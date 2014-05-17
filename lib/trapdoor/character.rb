class Character

attr_reader :level, :type, :race, :prof, :fullhp
attr_accessor :currenthp

  def initialize (args={})
#    args.each { |k, v| self.send "#{k}=", v }
    @race=args[:race]
    @title=args[:title]
    @prof=args[:prof]
    @fullhp=args[:fullhp]
    post_init(args)
  end

  def post_init(args) # Hook for subtypes
    raise NotImplementedError, "This #{self.class} cannot respond to: "
  end

  def attack_strength
    10 # Hands
  end

  def ac
    10 # Nothing
  end

  def fullhp
    @hp
  end

  def currenthp(points)
    # + heal or - damage
    @hp+points
  end

  def inventory
    nil
  end

  def equip_weapon

  end

  def equip_armour
    #int required. (Most monsters are too stupid)
  end

end

class Player < Character
  attr_reader :login, :stats, :name

  def post_init(args)
      @login=args[:login]
      @stats = args[:stats]
      @name = args[:name]
      @type='player'
  end

  def attack_strength()
    2
    # weapon
    # strength
    # dex
    # experience
  end

  def inventory
    "A Cat"
    #Load inventory. Used by Attack and Defence in their calculations
  end
end


class Monster < Character

  def post_init(args)
    @type='monster'
  end

  def attack_strength()
    4
    #from DB
  end

  def inventory
    "A Dog"
    #randomly generate inventory
  end

class NPC < Character
  attr_reader :login, :stats, :name

  def post_init(args)
    @login=args[:login]
    @stats = args[:stats]
    @name = args[:name]
    @type='NPC'
  end

  def attack_strength()
    4
    #from DB
  end

  def inventory
    "A Dog"
    #randomly generate inventory
  end
end

end
