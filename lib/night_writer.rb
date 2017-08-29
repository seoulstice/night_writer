require './lib/character_map'
require 'pry'
# require './lib/reader_writer'

class NightWriter
  attr_accessor :character_map,
                :raw_message
  attr_reader :input,
              :line_1,
              :line_2,
              :line_3,
              :combined
  def initialize
    @raw_message = ""
    @input = ""
    @split_input = []
    @line_1 = ""
    @line_2 = ""
    @line_3 = ""
    @output = []
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
    output_file.write(stack)
    output_file.close
  end

  def split_input_into_array
    # binding.pry
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
    raw_message.chop.length
  end

  def split_line_one_string_into_80_chars
    @line_1_array = []
    count = line_1.count
    while count > 0
      slice = line_1.slice!(0..79)
      line_1_array << slice
      count -= 80
    end
    line_1_array
  end

  def split_line_two_string_into_80_chars
    @line_2_array = []
    count = line_2.count
    while count > 0
      slice = line_2.slice!(0..79)
      line_2_array << slice
      count -= 80
    end
    line_2_array
  end

  def split_line_three_string_into_80_chars
    @line_3_array = []
    count = line_3.count
    while count > 0
      slice = line_3.slice!(0..79)
      line_3_array << slice
      count -= 80
    end
    line_3_array
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
    # binding.pry
    stack.join("")
  end

  # def combined_limited_lines
  #   # combined << line_1 << "\n" << line_2 << "\n" << line_3
  #   combined.join("\n")
    # array = combined.scan(/.{1,80}/m)
  # end

  # def stack(line_1, line_2, line_3)
  #   stack = ""
  #   until line_1.length == 0
  #     stack << line_1.slice!(0..79)
  #     stack << "\n"
  #     stack << line_2.slice!(0..79)
  #     stack << "\n"
  #     stack << line_3.slice!(0..79)
  #     stack << "\n\n"
  #   end
  #   stack.join("")
  # end




end

  # .scan(/.{1,80}/m)





  #.scan(/../) for seperating strings into two character strings


answer = NightWriter.new
answer.open_file
# answer.parse_file_contents_to_string
answer.split_input_into_array
answer.translate_each_letter
answer.stack
answer.write_file
puts "Created '#{ARGV[1]}' containing #{answer.count_output_characters} characters."
