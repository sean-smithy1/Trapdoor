#!/usr/bin/env ruby

VERSION = '0.0.1'
DATABASE_DIR=Dir.home() + '/.trapdoor'

require 'sqlite3'
require_relative 'trapdoor/character'
require_relative 'trapdoor/setup'
require_relative 'trapdoor/validates'
require_relative 'trapdoor/random_gen'
require_relative 'trapdoor/database'

module Trapdoor
  system('clear') || system('cls')

  puts "Welcome to TRAPDOOR an online MUD"

  input=nil
  until Validates.menu_input?(input)
    print "New Game, Saved Game or Quit [NSQ] "
    input = gets.chomp.upcase
  end

  case
    when input == "N"
      char=Setup.new
      player=char.create_character
 #   Play.new(player)
    when input == "S"

      char=Authenticate.user(login)
 #     Play.new(char)
    when input == "Q"
      puts "See Yah"
      DB.close()
  end
end
