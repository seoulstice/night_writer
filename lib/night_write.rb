
class NightWriter
  attr_reader :raw_input,
              :file_contents
  def initialize
    @file_contents
    @raw_input = ""
    # @file = ARGV[0]
  end

  # def get_input_filename
  #   filename = ARGV[0]
  #   filename
  # end

  def open_file(file)
    @file_contents = File.open(file)
  end

  def parse_file_contents_to_string
    file_contents.each do |line|
      if raw_input == ""
        raw_input << line.rstrip
      else
        raw_input << " " + line.rstrip
      end
    end
  end

  



  def count_output_characters

  end

  def output_message
    "Created 'braille.txt' containing #{} characters."
  end


end
