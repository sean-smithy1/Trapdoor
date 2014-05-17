class Database

  def initalize
    @db=SQLite3::Database.new( "#{DATABASE_DIR}/trapdoor.sqlite3" )
  end


  def write_player(obj)
    table=obj.class.to_s.downcase
    fields=obj.instance_variables.map { |var| var[1..-1] }.join(", ")
    values=obj.instance_variables.map { |var| obj.instance_variable_get(var) }.join(", ")

    @db.execute("INSERT INTO #{tabe}, (#{fields})
                        VALUES (#{values})"
  end

  def self.read()

  end

  def self.update()

  end

end
