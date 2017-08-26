
class NightWriter
  attr_reader :raw_input,
              :output_line_1,
              :output_line_2,
              :output_line_3
  def initialize
    @raw_input = ""
    @input = ""
    @output_line_1 = ""
    @output_line_2 = ""
    @output_line_3 = ""
  end

  def open_file
    input_file = File.open(ARGV[0], "r")
    @raw_input = input_file.read
    input_file.close
  end

  def write_file
    output_file = File.open(ARGV[1], "w")
    output_file.write(contents to be written to file)
    output_file.close
  end

  def parse_file_contents_to_string
    # raw_input.each do |line|
    #   if raw_input == ""
    #     input << line.rstrip
    #   else
    #     input << " " + line.rstrip
    #   end
    # end
  end

  def count_output_characters

  end

  def output_message
    "Created 'braille.txt' containing #{} characters."
  end


end
