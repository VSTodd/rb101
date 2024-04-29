require 'minitest/autorun'
require_relative 'swap_letters'

class TextTest < Minitest::Test
  def setup
    @file = File.open('swap_letters.txt')
    @text = @file.read
    @sample = Text.new(@text)
  end

  def test_swap
    assert_equal(@text.gsub('a', 'e'), @sample.swap('a', 'e'))
  end

  def test_word_count
    assert_equal(@text.split.count, @sample.word_count)
  end

  def teardown
    @file.close
  end
end
