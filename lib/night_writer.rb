require './lib/character_map'
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
    @split_input = input.split("")
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

  def combined_limited_lines
    combined = line_1 + line_2 + line_3
    array = combined.scan(/.{1,80}/m)
  end
end

  # .scan(/.{1,80}/m)





  #.scan(/../) for seperating strings into two character strings


answer = NightWriter.new
answer.open_file
answer.parse_file_contents_to_string
answer.split_input_into_array
answer.translate_each_letter
answer.write_file
puts "Created '#{ARGV[1]}' containing #{answer.count_output_characters} characters."
