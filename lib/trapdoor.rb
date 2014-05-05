#!/usr/bin/env ruby

$LOAD_PATH << '.'
require 'sqlite3'
require 'character'
require 'setup'
require 'validates'
require 'random_gen'

module Trapdoor

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

