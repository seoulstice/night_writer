require 'minitest/autorun'
require 'minitest/emoji'
require './lib/night_read'
require 'pry'

class NightReaderTest < Minitest::Test

  def test_night_reader_exists
    nr = NightReader.new

    assert_instance_of NightReader, nr
  end


end
