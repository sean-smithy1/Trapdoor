module ScreenInterface

  def ask_for_password(prompt = "Enter password: ")
    raise 'Could not ask for password because there is no interactive terminal (tty)' unless $stdin.tty?
    $stdout.print prompt unless prompt.nil?
    $stdout.flush
    raise 'Could not disable echo to ask for password securely' unless system 'stty -echo'
    password = $stdin.gets
    password.chomp! if password
    password
  ensure
    raise 'Could not re-enable echo while asking for password' unless system 'stty echo'
  end

end
