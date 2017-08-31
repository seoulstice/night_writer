require './lib/character_map'

class NightReader
  attr_accessor :raw_message,
                :character_map
  attr_reader :combined,
              :output,
              :line_1_array,
              :line_2_array,
              :line_3_array,
              :final_output,
              :line_1_combined,
              :line_2_combined,
              :line_3_combined
  def initialize
    @raw_message = ""
    @split_input = []
    @output = []
    @final_output = ""
    @line_1_array = []
    @line_2_array = []
    @line_3_array = []
    @line_1_combined = ""
    @line_2_combined = ""
    @line_3_combined = ""
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
    output_file.write(final_output)
    output_file.close
  end

  def split_input_into_array
    @split_input = raw_message.split("\n")
  end

  def separate_lines_into_respective_arrays
    @split_input.each_with_index do |line, index|
      if index % 3 == 0
        line_1_array << line
      elsif index % 3 == 1
        line_2_array << line
      else index % 3 == 2 || index % 3 == 2/3
        line_3_array << line
      end
    end
  end

  def join_line_arrays
    @line_1_combined = line_1_array.join
    @line_2_combined = line_2_array.join
    @line_3_combined = line_3_array.join
  end

  def split_combined_into_two_character_elements
    one = @line_1_combined.scan(/.{2}/)
    two = @line_2_combined.scan(/.{2}/)
    three = @line_3_combined.scan(/.{2}/)
    @combined = one.zip(two, three)
  end

  def translate_braille_to_english
    @combined.map do |element|
      output << CharacterMap.braille_to_english[element]
    end
    capitalized_output = translate_capital_braille(output)
    translate_braille_to_numbers(capitalized_output)
  end

  def translate_capital_braille(output)
    output.each_with_index do |letter, index|
      if letter == :cap
        final_output << output[index + 1].upcase
      elsif letter.upcase == final_output[-1]
        final_output
      else
        final_output << letter
      end
    end
    final_output
  end

  def translate_braille_to_numbers(capitalized_output)
    capitalized_output.gsub!(/#\S+/i) do |match_string|
      output = []
      match_string[1..-1].each_char do |letter|
       output << CharacterMap.braille_to_numbers[letter.downcase]
      end
      output.join("")
    end
    capitalized_output
  end

  def count_output_characters
    @count = final_output.length
  end
end

answer = NightReader.new
answer.open_file
answer.split_input_into_array
answer.separate_lines_into_respective_arrays
answer.join_line_arrays
answer.split_combined_into_two_character_elements
answer.translate_braille_to_english
answer.write_file
puts "Created '#{ARGV[1]}' containing #{answer.count_output_characters} characters."
