class Authenticate

  attr_reader :login

  def initialize(args)
    @login = args[:login]
    @password = args[:password]
  end

  def read_digest(login)

  end

end
