require './lib/character_map'

class NightWriter
  attr_accessor :character_map
  attr_reader :raw_message,
              :output_line_1,
              :output_line_2,
              :output_line_3
  def initialize
    @raw_message = ""
    @input = ""
    @output_line_1 = ""
    @output_line_2 = ""
    @output_line_3 = ""
    @character_map = CharacterMap.new
  end

  def open_file
    message_file = File.open(ARGV[0], "r")
    @raw_message = message_file.read
    message_file.close
  end

  def write_file
    output_file = File.open(ARGV[1], "w")
    output_file.write(contents to be written to file)
    output_file.close
  end

  def parse_file_contents_to_string
    raw_message.each do |line|
      if raw_message == ""
        input << line.rstrip
      else
        input << " " + line.rstrip
      end
    end
  end

  def parse_input_into_characters(name)
    different = name
    @input = different.split("")
    @input.each do |letter|
      if @character_map.letters[letter] != nil
        output_line_1 << @character_map.letters[letter][0]
        output_line_2 << @character_map.letters[letter][1]
        output_line_3 << @character_map.letters[letter][2]
      end
    end
    puts output_line_1
    puts output_line_2
    puts output_line_3
  end

  def count_output_characters

  end

  def output_message
    "Created 'braille.txt' containing #{} characters."
  end

  #.scan(/../) for seperating strings into two character strings


end

answer = NightWriter.new
puts answer.parse_input_into_characters("Hello, World!")
