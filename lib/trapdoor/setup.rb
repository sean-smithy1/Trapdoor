
class Setup
include ScreenInterface
# include RandomGen

  def initialize
    @db=Database.new
  end

  def create_character
    args = { }
    stats=Player.stats
    yn='n'

    system('clear') || system('cls')

    puts "Welcome to the game, you need to create a character to continue"
    puts "You are able to select a name, a race and a profession"
    puts "your outher abilities will be randomally generated."

    until Validates.name?(args[:name])
      print "What name would you like to go by? "
      args[:name] = gets.chomp
    end

    #until Validates.password?(args[:password])
      args[:password]=ask_for_password
    #end

    until Validates.entry?(args[:race])
      print "Ok #{args[:name]}, now choose a race:\nThe following racess are available, your choice will affect your abilities\n1. Human, 2. Elf, 3. Ding-A-Ling (1,2,or3): "
      args[:race] = gets.chomp
    end

    until Validates.entry?(args[:prof])
      puts "Ok #{args[:name]}, now choose a profession: "
      puts "The following professions are available, your choice will affect your abilities"
      print "1. Mage, 2. Warrior, 3. Ranger (1,2,or 3): "
      args[:prof] = gets.chomp
    end

    until Validates.ok?(yn)
      puts "Ok #{args[:name]} Below are the generated stats for this character."

      stats.each_key { |k|
        stats[k]=RandomGen.char_stat
        printf("%-10s: %2d\n", k, stats[k])
      }

      args[:fullhp]=RandomGen.hitpoints(stats[:con])
      args[:level]=1
      printf("%-10s: %2d\n", "hp:", args[:fullhp])
      puts "\n"
      print "Try again? (YN):"
      yn=gets.chomp
    end

    args.merge!stats
    player=Player.new(args)
    @db.write(player)
    return player
  end

end
