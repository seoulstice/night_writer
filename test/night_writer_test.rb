require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'
require 'pry'

class NightWriterTest < Minitest::Test

  def test_night_writer_exists

    nw = NightWriter.new
  binding.pry

    assert_instance_of NightWriter, nw
  end

  def test_night_writer_has_empty_string_by_default
    skip
    nw = NightWriter.new

    assert_equal "", nw.raw_message
  end

  def test_it_can_open_file
    skip
    nw = NightWriter.new
    nw.open_file

    assert_equal "Hello", nw.raw_message
  end

  def test_it_can_split_raw_message_into_array
    skip
    nw = NightWriter.new
    nw.open_file
    expected = ["H", "e", "l", "l", "o"]

    assert_equal expected, nw.split_input_into_array
  end

  def test_it_can_translate_letters
    skip
    nw = NightWriter.new
    nw.open_file
    nw.split_input_into_array
    nw.translate_each_letter

    expected_line_1_braille = "..0.0.0.0.0."
    expected_line_2_braille = "..00.00.0..0"
    expected_line_3_braille = ".0....0.0.0."

    assert_equal expected_line_1_braille, nw.line_1
    assert_equal expected_line_2_braille, nw.line_2
    assert_equal expected_line_3_braille, nw.line_3
  end

  def test_it_can_count_characters_of_output
    skip
    nw = NightWriter.new
    nw.open_file

    assert_equal 5, nw.count_output_characters
  end

  def test_it_can_split_line_one_into_80_char_strings
    # skip
    nw = NightWriter.new
    nw.open_file
    nw.split_input_into_array
    nw.translate_each_letter
    nw.split_line_one_string_into_80_chars
    nw.split_line_two_string_into_80_chars
    nw.split_line_three_string_into_80_chars
    expected_line_1 = ["...00..0.0.0.00.000..0.00.000..00.0..0.0.00.00.0000.0.0.0.00.00.0..00.0.0000000.",
                      "0..00..0.0.00000000.0.000..00..0..0.0.00000.00000..00..00.0.0.0.0.000.000.0.0.00",
                      ".0...00..0.0.0.00.000..0.00.000..00.0..0.0.00.00.0000.0.0.0.00.00.0..00.0.000000",
                      "0.0..00..0.0.00000000.0.000..00..0..0.0.00000.00000..00..00.0.0.0.0.000.000.0.0.",
                      "00.0............................................................"]
    expected_line_2 = ["..00000.0.0.0......00.0...00.00000..000.0...0.00..00..00....00.0000.0..0.0000..0",
                      "0000.00.000..0000...000..00..00.00..0....0.00.00000...00......0........0...0..0.",
                      "00..00000.0.0.0......00.0...00.00000..000.0...0.00..00..00....00.0000.0..0.0000.",
                      ".00000.00.000..0000...000..00..00.00..0....0.00.00000...00......0........0...0..",
                      "0.00............................................................"]
    expected_line_3 = [".00.....0...0...0...0.0.......0.....0...0.............0.....0...0.0.0.0.0.....0.",
                      "0.0...0.0...0...0.000.0.0.0...0..0..............................................",
                      "...00.....0...0...0...0.0.......0.....0...0.............0.....0...0.0.0.0.0.....",
                      "0.0.0...0.0...0...0.000.0.0.0...0..0............................................",
                      "................................................................"]

    assert_equal expected_line_1, nw.line_1_array
    assert_equal expected_line_2, nw.line_2_array
    assert_equal expected_line_3, nw.line_3_array
  end

  def test_it_can_stack_and_give_output
    #skip
    nw = NightWriter.new
    nw.open_file
    nw.split_input_into_array
    nw.translate_each_letter
    nw.split_line_one_string_into_80_chars
    nw.split_line_two_string_into_80_chars
    nw.split_line_three_string_into_80_chars
    nw.stack

    expected = "...00..0.0.0.00.000..0.00.000..00.0..0.0.00.00.0000.0.0.0.00.00.0..00.0.0000000.\n..00000.0.0.0......00.0...00.00000..000.0...0.00..00..00....00.0000.0..0.0000..0\n.00.....0...0...0...0.0.......0.....0...0.............0.....0...0.0.0.0.0.....0.\n0..00..0.0.00000000.0.000..00..0..0.0.00000.00000..00..00.0.0.0.0.000.000.0.0.00\n0000.00.000..0000...000..00..00.00..0....0.00.00000...00......0........0...0..0.\n0.0...0.0...0...0.000.0.0.0...0..0..............................................\n.0...00..0.0.0.00.000..0.00.000..00.0..0.0.00.00.0000.0.0.0.00.00.0..00.0.000000\n00..00000.0.0.0......00.0...00.00000..000.0...0.00..00..00....00.0000.0..0.0000.\n...00.....0...0...0...0.0.......0.....0...0.............0.....0...0.0.0.0.0.....\n0.0..00..0.0.00000000.0.000..00..0..0.0.00000.00000..00..00.0.0.0.0.000.000.0.0.\n.00000.00.000..0000...000..00..00.00..0....0.00.00000...00......0........0...0..\n0.0.0...0.0...0...0.000.0.0.0...0..0............................................\n00.0............................................................\n0.00............................................................\n................................................................\n"
    assert_equal expected, nw.output
  end

end
