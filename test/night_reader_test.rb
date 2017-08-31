require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_reader'
require 'pry'

class NightReaderTest < Minitest::Test

  def test_night_reader_exists
    skip
    nr = NightReader.new

    assert_instance_of NightReader, nr
  end

  def test_night_writer_has_empty_input_by_default
    skip
    nw = NightReader.new

    assert_equal "", nw.raw_message
  end

  def test_it_can_open_file
    skip
    nw = NightReader.new
    nw.open_file
    expected = "..0.0.0.0.0.\n..00.00.0..0\n.0....0.0.0.\n"

    assert_equal expected, nw.raw_message
  end

  def test_it_can_split_raw_message_into_array
    skip
    nw = NightReader.new
    nw.open_file
    expected = ["..0.0.0.0.0.", "..00.00.0..0", ".0....0.0.0."]

    assert_equal expected, nw.split_input_into_array
  end

  def test_it_can_separate_lines_array_by_index
    skip
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
    skip
    nw = NightReader.new
    nw.open_file
    nw.split_input_into_array
    nw.separate_lines_into_respective_arrays
    nw.join_line_arrays
    expected_line_1_combined = "..0.0.0.0.0."
    expected_line_2_combined = "..00.00.0..0"
    expected_line_3_combined = ".0....0.0.0."

    assert_equal expected_line_1_combined, nw.line_1_combined
    assert_equal expected_line_2_combined, nw.line_2_combined
    assert_equal expected_line_3_combined, nw.line_3_combined
  end

  def test_it_can_split_combined_arrays_into_two_chars
    skip
    nw = NightReader.new
    nw.open_file
    nw.split_input_into_array
    nw.separate_lines_into_respective_arrays
    nw.join_line_arrays
    nw.split_combined_into_two_character_elements
    expected = [["..", "..", ".0"], ["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]

    assert_equal expected, nw.combined
  end

  def test_it_can_translate_braille_to_english_and_detect_capital_letter
    skip
    nw = NightReader.new
    nw.open_file
    nw.split_input_into_array
    nw.separate_lines_into_respective_arrays
    nw.join_line_arrays
    nw.split_combined_into_two_character_elements
    nw.translate_braille_to_english
    expected = [:cap, "h", "e", "l", "l", "o"]

    assert_equal expected, nw.output
  end

  def test_it_can_translate_capital_braille
    skip
    nw = NightReader.new
    nw.open_file
    nw.split_input_into_array
    nw.separate_lines_into_respective_arrays
    nw.join_line_arrays
    nw.split_combined_into_two_character_elements
    nw.translate_braille_to_english
    expected ="Hello"

    assert_equal expected, nw.final_output
  end

  def test_it_can_translate_braille_numbers_to_numbers
    # skip
    nw = NightReader.new
    nw.open_file
    nw.split_input_into_array
    nw.separate_lines_into_respective_arrays
    nw.join_line_arrays
    nw.split_combined_into_two_character_elements
    nw.translate_braille_to_english

    assert_equal 
  end
end
