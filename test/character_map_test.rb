require 'minitest/autorun'
require 'minitest/emoji'
require './lib/character_map'
require 'pry'

class CharacterMapTest < Minitest::Test

  def test_character_map_exists
    cm = CharacterMap.new

    assert_instance_of CharacterMap, cm
  end

  def test_character_map_has_characters
    cm = CharacterMap.new

    assert_instance_of Hash, cm.characters
  end
end
