require './character_map'
require 'pry'
# require './lib/reader_writer'

class NightWriter
  attr_accessor :character_map,
                :raw_message
  attr_reader :line_1,
              :line_2,
              :line_3,
              :combined,
              :output,
              :line_1_array,
              :line_2_array,
              :line_3_array
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
    message_path = File.join(File.dirname(__FILE__), "../#{ARGV[0]}")
    message_file = File.open(message_path, "r")
    @raw_message = message_file.read
    message_file.close
  end

  def write_file
    output_path = File.join(File.dirname(__FILE__), "../#{ARGV[1]}")
    output_file = File.open(output_path, "w")
    output_file.write(@output)
    output_file.close
  end

  def split_input_into_array
    @split_input = raw_message.split("")
  end

  def translate_each_letter(input)
    @split_input.each do |letter|
      if CharacterMap.dictionary[letter] != nil
        line_1 << CharacterMap.dictionary[letter][0]
        line_2 << CharacterMap.dictionary[letter][1]
        line_3 << CharacterMap.dictionary[letter][2]
      end
    end
  end

  def count_output_characters
    raw_message.chop.length
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
      stack << "\n\n"
    end
    @output = stack.join("")
  end
end


answer = NightWriter.new
answer.open_file
# answer.parse_file_contents_to_string
answer.split_input_into_array
answer.translate_each_letter(@split_input)
answer.split_line_one_string_into_80_chars
answer.split_line_two_string_into_80_chars
answer.split_line_three_string_into_80_chars
answer.stack
answer.write_file
puts "Created '#{ARGV[1]}' containing #{answer.count_output_characters} characters."
