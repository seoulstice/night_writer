require './lib/character_map'
require './lib/reader_writer'

class NightWriter
  attr_accessor :character_map,
                :reader_writer
  attr_reader :raw_message,
              :input,
              :output_line_1,
              :output_line_2,
              :output_line_3
  def initialize
    @raw_message = ""
    @input = ""
    @split_input = []
    @output_line_1 = ""
    @output_line_2 = ""
    @output_line_3 = ""
    @character_map = CharacterMap.new
    @reader_writer = ReaderWriter.new
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

  def parse_input_into_characters
    # different = name
    split_input = @input.split("")
    split_input.each do |letter|
      if @character_map.letters[letter] != nil
        output_line_1 << @character_map.letters[letter][0]
        output_line_2 << @character_map.letters[letter][1]
        output_line_3 << @character_map.letters[letter][2]
      end
    end
    # puts output_line_1
    # puts output_line_2
    # puts output_line_3
  end

  def count_output_characters

  end

  # def limit_length_of_output_line_1
  #   output_line_1_limited = (output_line_1 + ' ' * 80)[0,80]
  #   output_line_1_limited
  # end
  #
  # def limit_length_of_output_line_2
  #   output_line_2_limited = (output_line_2 + ' ' * 80)[0,80]
  #   output_line_2_limited
  # end
  #
  # def limit_length_of_output_line_3
  #   output_line_3_limited = (output_line_3 + ' ' * 80)[0,80]
  #   output_line_3_limited
  # end

  def combined_limited_lines
    limit_length_of_output_line_1 + "\n" + limit_length_of_output_line_2 + "\n" + limit_length_of_output_line_3

  end

  #.scan(/../) for seperating strings into two character strings

end

answer = NightWriter.new
answer.reader_writer.open_file
answer.parse_file_contents_to_string
answer.parse_input_into_characters
answer.wrap(combined_limited_lines. width=80)
answer.write_file
