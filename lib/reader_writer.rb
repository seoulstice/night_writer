
class ReaderWriter

  def reader
    message_file = File.open(ARGV[0], "r")
    @raw_message = message_file.read
    # message_file.close
  end

  def write_file
    output_file = File.open(ARGV[1], "w")
    output_file.write(limit_length_of_output_line_1 + "\n" + limit_length_of_output_line_2 + "\n" + limit_length_of_output_line_3)
    # output_file.close
  end
end
