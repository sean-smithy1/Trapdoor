module Setup
  def self.character

    system('clear') || system('cls')

    puts "Welcome to the game, you need to create a character to continue"
    puts "You are able to select a name, a race and a profession"
    puts "your outher abilities will be randomally generated."

    name, race, prof, yn =nil

    until Validates.name?(name)
      print "What name would you like to go by? "
      name = gets.chomp
    end

    until Validates.entry?(race)
      puts "Ok #{name}, now choose a race: "
      puts "The following racess are available, your choice will affect your abilities"
      puts "1. Human, 2. Elf, 3. Ding-A-Ling"
      print "1, 2, or 3: "
      race = gets.chomp
    end

    until Validates.entry?(prof)
      puts "Ok #{name}, now choose a profession: "
      puts "The following professions are available, your choice will affect your abilities"
      puts "1. Mage, 2. Warrior, 3. Ranger"
      print "1, 2, or 3:"
      prof = gets.chomp
    end

    until Validates.ok?(yn)
      puts "Ok #{name} Below are the generated stats for this character."
      print "Strength:     "
      puts str=RandomGen.char_stat
      print "Intelligence: "
      puts int=RandomGen.char_stat
      print "Dexterity:    "
      puts dex=RandomGen.char_stat
      print "Wisdom:      "
      puts wis=RandomGen.char_stat
      print "Constitution:"
      puts con=RandomGen.char_stat
      print "Charisma:    "
      puts chr=RandomGen.char_stat
      puts "\n"
      print "Health:        "
      puts RandomGen.hitpoints(con)
      puts "\n"
      print "Is this OK? (YN):"
      yn=gets.chomp
    end

    #write char
    #instance char

  end
end
