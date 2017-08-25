require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write'
require 'pry'

class NightWriterTest < Minitest::Test

  def test_night_writer_exists
    nw = NightWriter.new
binding.pry
    assert_instance_of NightWriter, nw
  end

  def test_night_writer_has_empty_string
    nw = NightWriter.new

    assert_instance_of String, nw.raw_input
    assert_equal "", nw.raw_input
  end

  def test_it_can_open_file
    skip
    nw = NightWriter.new
    nw.open_file
    nw.parse_contents_to_string

    assert_equal "Hello, World!", nw.raw_input
  end

  def test_it_can_count_characters_of_output
    skip
  end

end
