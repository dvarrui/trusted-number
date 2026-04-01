# frozen_string_literal: true

require "test_helper"

class Base2SumTest < Test::Unit::TestCase
  include TrustedNumbersSetup

  def setup
    setup_base2
  end

  test "add" do
    num1 = TrustedNumber.new("100", base: 2)
    num2 = TrustedNumber.new("101", base: 2)
    num3 = TrustedNumber.new("1001", base: 2)
    assert_equal(num3, num1 + num2)

    num1 = TrustedNumber.new("0.01", base: 2)
    num2 = TrustedNumber.new("0.10", base: 2)
    num3 = TrustedNumber.new("0.11", base: 2)
    assert(num3 == num1 + num2)

    num1 = TrustedNumber.new("0111", base: 2)
    num2 = TrustedNumber.new("0001", base: 2)
    num3 = TrustedNumber.new("1000", base: 2)
    assert_equal(num3.about, (num1 + num2).about)

    num1 = TrustedNumber.new("11.11", base: 2)
    num2 = TrustedNumber.new(".01", base: 2)
    num3 = TrustedNumber.new("100.0", base: 2)
    assert_equal(num3, num1 + num2)
  end

  test "add ZERO" do
    assert_equal(@zero, @zero + @zero)
    assert_equal(@num1, @num1 + @zero)
    assert_equal(@num2, @num2 + @zero)
    assert_equal(@num3, @num3 + @zero)
  end
end
