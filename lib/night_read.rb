

class NightReader

  def initialize

  end

  def open_file
    message_file = File.open(ARGV[0], "r")
    @raw_message = message_file.read
    message_file.close
  end

  



end



puts "Created '#{ARGV[0]}' containing #{} characters."
