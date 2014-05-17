module Setup
  def self.character

    valid=Validates.new
    player=Player.new

    system('clear') || system('cls')

    puts "Welcome to the game, you need to create a character to continue"
    puts "You are able to select a name, a race and a profession"
    puts "your outher abilities will be randomally generated."

    until valid.name?(player.name)
      print "What name would you like to go by? "
      player.name = gets.chomp
    end

    until valid.entry?(player.race)
      print "Ok #{name}, now choose a race:\nThe following racess are available, your choice will affect your abilities\n1. Human, 2. Elf, 3. Ding-A-Ling (1,2,or3): "
      player.race = gets.chomp
    end

    until valid.entry?(player.prof)
      puts "Ok #{name}, now choose a profession: "
      puts "The following professions are available, your choice will affect your abilities"
      print "1. Mage, 2. Warrior, 3. Ranger (1,2,or 3): "
      player.prof = gets.chomp
    end

    until valid.ok?(yn)
      puts "Ok #{name} Below are the generated stats for this character."

      stats.each { |k,v|
        v=RandomGen.char_stat
        printf("%-10s: %2d\n", k,v)
      }
      stats.merge!(fullhp: RandomGen.hitpoints(stats[:con])) "",
      printf("%-10s: %2d\n", "hp:", stats[:hp])

      puts "\n"
      print "Is this OK? (YN):"
      yn=gets.chomp
    end

    Database.write(player)


  end
end
