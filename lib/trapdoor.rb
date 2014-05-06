#!/usr/bin/env ruby

DATABASE_DIR=Dir.home() + '/.trapdoor'

require 'sqlite3'
require_relative 'trapdoor/character'
require_relative 'trapdoor/setup'
require_relative 'trapdoor/validates'
require_relative 'trapdoor/random_gen'

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
      char=Setup.character
 #     Play.new(char)
    when input == "S"

      char=Authenticate.user(login)
 #     Play.new(char)
    when input == "Q"
      puts "See Yah"
  end
end
