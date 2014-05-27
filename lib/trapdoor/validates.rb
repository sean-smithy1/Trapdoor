module Validates

  def self.menu_input?(input)
    /^[NSQ]$/.match(input)
  end

  def self.name?(name)
    /^[a-z]{1,20}$/i.match(name)
  end

  def self.entry?(prof_num)
    /^[123]$/.match(prof_num)
  end

  def self.ok?(yn)
    /^[y]$/i.match(yn)
  end

  def self.password?(password)
    true if password.length > 6
  end

end
