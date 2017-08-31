require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'
require 'pry'

class NightWriterTest < Minitest::Test

  def test_night_writer_exists
    nw = NightWriter.new message.txt braille.txt

    assert_instance_of NightWriter, nw
  end

  def test_night_writer_has_empty_string
    skip
    nw = NightWriter.new

    assert_instance_of String, nw.raw_message
    assert_equal "", nw.raw_message
  end

  def test_it_can_open_file
    skip
    nw = NightWriter.new
    nw.open_file
    nw.parse_contents_to_string

    assert_equal "Hello, World!", nw.raw_message
  end

  def test_it_can_count_characters_of_output
    skip
  end

end