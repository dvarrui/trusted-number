# frozen_string_literal: true

require "test_helper"

class Base10LoaderTest < Test::Unit::TestCase

  test "Integer" do
    num = TNumber.new()
    TrustedNumber::Load.new(num).from_string("012")

    assert_equal "-", num.sign
    assert_equal "12", num.mant
    assert_equal 0, num.exp
    assert_equal true, num.is_valid?

  end
end
