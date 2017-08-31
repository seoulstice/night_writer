require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'
require 'pry'

class NightWriterTest < Minitest::Test

  def test_night_writer_exists
    nw = NightWriter.new

    assert_instance_of NightWriter, nw
  end

  def test_night_writer_has_empty_string_by_default
    nw = NightWriter.new

    assert_equal "", nw.raw_message
  end

  def test_it_can_open_file
    nw = NightWriter.new
    nw.open_file

    assert_equal "Hello", nw.raw_message
  end

  def test_it_can_split_raw_message_into_array
    nw = NightWriter.new
    nw.open_file
    expected = ["H", "e", "l", "l", "o"]

    assert_equal expected, nw.split_input_into_array
  end

  def test_it_can_translate_letters
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
    nw = NightWriter.new
    nw.open_file

    assert_equal 5, nw.count_output_characters
  end

  def test_it_can_split_line_one_into_80_char_strings
    skip
    nw = NightWriter.new
    nw.open_file
    nw.split_input_into_array
    nw.translate_each_letter
binding.pry


  end


end
