require 'minitest/autorun'
require 'minitest/emoji'
require './lib/character_map'


class CharacterMapTest < Minitest::Test

  def test_character_map_exists
    cm = CharacterMap

    assert_instance_of Module, cm
  end

  def test_character_map_has_english_to_braille_dictionary_hash
    cm = CharacterMap

    assert_instance_of Hash, cm.dictionary
  end

  def test_character_map_has_braille_to_numbers_hash
    cm = CharacterMap

    assert_instance_of Hash, cm.braille_to_numbers
  end

  def test_character_map_has_braille_to_english_hash
    cm = CharacterMap

    assert_instance_of Hash, cm.braille_to_english
  end
end
