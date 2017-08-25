require 'minitest/autorun'
require 'minitest/emoji'
require './lib/character_map'
require 'pry'

class CharacterMapTest < Minitest::Test

  def test_character_map_exists
    cm = CharacterMap.new

    assert_instance_of CharacterMap, cm
  end

  def test_character_map_class_has_letters
    cm = CharacterMap.new

    assert_instance_of Hash, cm.letters
  end

  def test_character_map_class_has_symbols
    cm = CharacterMap.new

    assert_instance_of Hash, cm.symbols
  end

  def test_character_map_class_has_contractions
    cm = CharacterMap.new

    assert_instance_of Hash, cm.contractions
  end

  def test_character_map_class_has_numbers
    cm = CharacterMap.new

    assert_instance_of Hash, cm.numbers
  end

end
