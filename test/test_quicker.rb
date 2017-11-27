require 'minitest/autorun'
require 'quicker'

class QuickerTest < Minitest::Test
  include Quicker

  def test_start
    assert_output( /Start/ ) { start }
    assert_output( /Elapsed time: 0ms/ ) { start }
  end

  def test_check
    assert_output( /Method:/ ) { check }
    assert_output( /Elapsed time:/ ) { check }
  end

  def test_finish
    assert_output( /Finished!/ ) { finish }
    assert_output( /Total elapsed time:/ ) { finish }
  end
end
