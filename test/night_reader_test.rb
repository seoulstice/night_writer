require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_reader'
require 'pry'

class NightReaderTest < Minitest::Test

  def test_night_reader_exists
    nr = NightReader.new

    assert_instance_of NightReader, nr
  end

  def test_night_writer_has_empty_input_by_default
    nw = NightReader.new

    assert_equal "", nw.raw_message
  end

  def test_it_can_open_file
    nw = NightReader.new
    nw.open_file
    expected = "..0.0.0.0.0.\n..00.00.0..0\n.0....0.0.0.\n"

    assert_equal expected, nw.raw_message
  end

  def test_it_can_split_raw_message_into_array
    nw = NightReader.new
    nw.open_file
    expected = ["..0.0.0.0.0.", "..00.00.0..0", ".0....0.0.0."]

    assert_equal expected, nw.split_input_into_array
  end

  def test_it_can_separate_lines_array_by_index
    nw = NightReader.new
    nw.open_file
    nw.split_input_into_array
    nw.separate_lines_into_respective_arrays
    expected_line_1_array = ["..0.0.0.0.0."]
    expected_line_2_array = ["..00.00.0..0"]
    expected_line_3_array = [".0....0.0.0."]

    assert_equal expected_line_1_array, nw.line_1_array
    assert_equal expected_line_2_array, nw.line_2_array
    assert_equal expected_line_3_array, nw.line_3_array
  end

  def test_it_can_join_line_arrays
    nw = NightReader.new
    nw.open_file
    nw.split_input_into_array
    nw.separate_lines_into_respective_arrays
    nw.join_line_arrays
    binding.pry
    # expected_line_1_combined =
    # expected_line_2_combined =
    # expected_line_3_combined =
  end
end
