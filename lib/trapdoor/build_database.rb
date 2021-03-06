#!/usr/bin/env ruby
require 'sqlite3'
DATABASE_DIR=Dir.home() + '/.trapdoor'

Dir.mkdir(DATABASE_DIR) unless Dir.exists?(DATABASE_DIR)

db=SQLite3::Database.new( "#{DATABASE_DIR}/trapdoor.sqlite3" )

# Create tables
sql = <<SQL
    CREATE TABLE IF NOT EXISTS player(id INTEGER PRIMARY KEY ASC, name TEXT, password TEXT, race TEXT, prof TEXT, fullhp INTEGER, level INTEGER, current_hp INTEGER, str INTEGER, int INTEGER, wis INTEGER, dex INTEGER, con INTEGER, chr INTEGER, story_id, map_id);
    CREATE TABLE IF NOT EXISTS monster(id INTEGER PRIMARY KEY ASC, race TEXT, prof TEXT, fullhp INTEGER, level INTEGER, current_hp INTEGER, str INTEGER, int INTEGER, wis INTEGER, dex INTEGER, con INTEGER, chr INTEGER, story_id, map_id);
    CREATE TABLE IF NOT EXISTS npc(id INTEGER PRIMARY KEY ASC, name TEXT, race TEXT, prof TEXT, fullhp INTEGER, level INTEGER, current_hp INTEGER, str INTEGER, int INTEGER, wis INTEGER, dex INTEGER, con INTEGER, chr INTEGER, story_id, map_id);
    CREATE TABLE IF NOT EXISTS items(id INTEGER PRIMARY KEY ASC, type, description);
    CREATE TABLE IF NOT EXISTS char_inv(id INTEGER PRIMARY KEY ASC, char_id INT, inv_id INT);
    CREATE TABLE IF NOT EXISTS story(id INTEGER PRIMARY KEY ASC,description);
    CREATE TABLE IF NOT EXISTS map(id INTEGER PRIMARY KEY ASC,x,y,z,story_id,item_id, char_id);
SQL

db.execute_batch( sql )

