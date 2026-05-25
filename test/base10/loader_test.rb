# frozen_string_literal: true

require "test_helper"

class Base10LoaderTest < Test::Unit::TestCase
  test "Zero" do
    n = TNumber.new()
    TrustedNumber::Load.new(n).from_string("0")

    assert_equal "", n.sign
    assert_equal "0", n.mant
    assert_equal 10, n.base
    assert_equal 0, n.exp
    assert_equal true, n.is_valid?
  end

  test "num1" do
    n = TNumber.new()
    TrustedNumber::Load.new(n).from_string("123.456")

    assert_equal "", num.sign
    assert_equal "123456", num.mant
    assert_equal -3, num.exp
    assert_equal true, num.is_valid?
  end

  test "num2" do
    num = TNumber.new()
    TrustedNumber::Load.new(num).from_string("123")

    assert_equal "-", num.sign
    assert_equal "123", num.mant
    assert_equal 0, num.exp
    assert_equal true, num.is_valid?
  end
end
