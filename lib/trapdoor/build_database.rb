#!/usr/bin/env ruby
require 'sqlite3'

db=SQLite3::Database.new( "trapdoor.sqlite" )

# Create tables
sql = <<SQL
    CREATE TABLE IF NOT EXISTS characters(id INTEGER PRIMARY KEY ASC, login, name , race, prof, full_hp, current_hp, story_id, map_id);
    CREATE TABLE IF NOT EXISTS inventory(id INTEGER PRIMARY KEY ASC, type, description);
    CREATE TABLE IF NOT EXISTS char_inv(id INTEGER PRIMARY KEY ASC, char_id INT, inv_id INT);
    CREATE TABLE IF NOT EXISTS story(id INTEGER PRIMARY KEY ASC,description);
    CREATE TABLE IF NOT EXISTS map(id INTEGER PRIMARY KEY ASC,x,y,z,story_id,item_id, char_id);
SQL

db.execute_batch( sql )
