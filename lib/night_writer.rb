require './lib/character_map'

class NightWriter
  attr_accessor :character_map
  attr_reader :line_1,
              :line_2,
              :line_3,
              :combined,
              :output,
              :line_1_array,
              :line_2_array,
              :line_3_array,
              :raw_message
  def initialize
    @raw_message = ""
    @split_input = []
    @line_1 = ""
    @line_2 = ""
    @line_3 = ""
    @output = ""
    @line_1_array = []
    @line_2_array = []
    @line_3_array = []
  end

  def open_file
    message_file = File.open(ARGV[0], "r")
    @raw_message = message_file.read
    message_file.close
  end

  def write_file
    output_file = File.open(ARGV[1], "w")
    output_file.write(output)
    output_file.close
  end

  def split_input_into_array
    @split_input = raw_message.split("")
  end

  def translate_each_letter
    @split_input.each do |letter|
      if CharacterMap.dictionary[letter] != nil
        line_1 << CharacterMap.dictionary[letter][0]
        line_2 << CharacterMap.dictionary[letter][1]
        line_3 << CharacterMap.dictionary[letter][2]
      end
    end
  end

  def count_output_characters
    raw_message.length
  end

  def split_line_one_string_into_80_chars
    count = line_1.length
    while count > 0
      slice = line_1.slice!(0..79)
      @line_1_array << slice
      count -= 80
    end
  end

  def split_line_two_string_into_80_chars
    count = line_2.length
    while count > 0
      slice = line_2.slice!(0..79)
      @line_2_array << slice
      count -= 80
    end
  end

  def split_line_three_string_into_80_chars
    count = line_3.length
    while count > 0
      slice = line_3.slice!(0..79)
      @line_3_array << slice
      count -= 80
    end
  end

  def stack
    stack = []
    until @line_1_array.empty?
      stack << line_1_array.shift
      stack << "\n"
      stack << line_2_array.shift
      stack << "\n"
      stack << line_3_array.shift
      stack << "\n"
    end
    @output = stack.join("")
  end
end

answer = NightWriter.new
answer.open_file
answer.split_input_into_array
answer.translate_each_letter
answer.split_line_one_string_into_80_chars
answer.split_line_two_string_into_80_chars
answer.split_line_three_string_into_80_chars
answer.stack
answer.write_file
puts "Created '#{ARGV[1]}' containing #{answer.count_output_characters} characters."
