require './lib/character_map'

class NightWriter
  attr_accessor :character_map
  attr_reader :raw_message,
              :input,
              :line_1,
              :line_2,
              :line_3
  def initialize
    @raw_message = ""
    @input = ""
    @split_input = []
    @line_1 = ""
    @line_2 = ""
    @line_3 = ""
    @character_map = CharacterMap.new
  end

  def open_file
    message_file = File.open(ARGV[0], "r")
    @raw_message = message_file.read
    message_file.close
  end

  def write_file
    output_file = File.open(ARGV[1], "w")
    output_file.write(combined_limited_lines)
    output_file.close
  end

  def parse_file_contents_to_string
    raw_message.each_char do |line|
      if raw_message == ""
        input << line.rstrip
      else
        input << " " + line.rstrip
      end
    end
  end

  def split_input_into_array
    @split_input = @input.split("")
  end

  def translate_each_letter
    @split_input.each do |letter|
      if @character_map.chars[letter] != nil
        line_1 << @character_map.chars[letter][0]
        line_2 << @character_map.chars[letter][1]
        line_3 << @character_map.chars[letter][2]
      end
    end
  end

  def count_output_characters
    raw_message.chop.length
    end
  end

  # def line_1_limited
  #   output_line_1_limited = (line_1 + ' ' * 80)[0,80]
  #   output_line_1_limited
  # end
  #
  # def line_2_limited
  #   output_line_2_limited = (line_2 + ' ' * 80)[0,80]
  #   output_line_2_limited
  # end
  #
  # def line_3_limited
  #   output_line_3_limited = (line_3 + ' ' * 80)[0,80]
  #   output_line_3_limited
  # end

  def combined_limited_lines()
    # combined = line_1 + "\n" + line_2 + "\n" + line_3
    # combined.slice(0..79)
    slice_1 = line_1.slice(0..79)
    slice_2 = line_2.slice!(0..79)
    slice_3 = line_3.slice(0..79) 

    require 'pry' ;binding.pry
    slice_4 = line_1.slice(80..-1)

    combined_slice = slice_1 + "\n" + slice_2 + "\n" + slice_3 + "\n"

  end

  def determine_string_length
    if line_1.length < 80
      return
    else line_1.length > 80
      line_1.slice(0.79)


  end



  #.scan(/../) for seperating strings into two character strings

end

answer = NightWriter.new
answer.open_file
answer.parse_file_contents_to_string
answer.split_input_into_array
answer.translate_each_letter
answer.write_file
puts "Created '#{ARGV[1]}' containing #{answer.count_output_characters} characters."
