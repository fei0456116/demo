require 'test_helper'

class CastTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Cast.new.valid?
  end
end
