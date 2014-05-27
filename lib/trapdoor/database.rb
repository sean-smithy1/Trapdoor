class Database

require 'sqlite3'
DATABASE_DIR=Dir.home() + '/.trapdoor'


  def initialize
    @db=SQLite3::Database.new( "#{DATABASE_DIR}/trapdoor.sqlite3" )
  end


  def write(obj)
    table=obj.class.to_s.downcase
    fields=obj.instance_variables.map { |var| var[1..-1] }.join(", ")
    num_fields=obj.instance_variables.count
    bind_values=obj.instance_variables.map { |var| obj.instance_variable_get(var) }

    @db.execute("INSERT INTO #{table} (#{fields}) VALUES (#{(['?'] * num_fields).join(', ')})",  bind_values)
  end

  def load(id)

  end

  def update()

  end

  def get_pw(name)
    @db.execute("SELECT password FROM player WHERE name = #{name}")
  end

end
