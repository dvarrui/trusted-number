# frozen_string_literal: true

require "test_helper"

class Base2Test < Test::Unit::TestCase
  def setup
    @num1 = TrustedNumber.new("101.001", base: 2)
    @num2 = TrustedNumber.new("101", base: 2)
    @num3 = TrustedNumber.new(".001", base: 2)
  end

  test "new" do
    assert(@num1.value == "101.001")
    assert(@num1.base == 2)
    assert(@num2.value == "101")
    assert(@num2.base == 2)
    assert(@num3.value == ".001")
    assert(@num3.base == 2)
  end

  test "equal" do
    assert(@num1 == TrustedNumber.new("101.001", base: 2))
    assert(@num1 == TrustedNumber.new("0101.001", base: 2))
    assert(@num1 == TrustedNumber.new("0101.0010", base: 2))
    assert(@num1 == TrustedNumber.new("101.0010", base: 2))

    assert(@num2 == TrustedNumber.new("101", base: 2))
    assert(@num2 == TrustedNumber.new("0101", base: 2))
    assert(@num2 == TrustedNumber.new("0101", base: 2))
    assert(@num2 == TrustedNumber.new("101.0", base: 2))

    assert(@num3 == TrustedNumber.new(".001", base: 2))
    assert(@num3 == TrustedNumber.new("0.001", base: 2))
    assert(@num3 == TrustedNumber.new("0.0010", base: 2))
    assert(@num3 == TrustedNumber.new(".0010", base: 2))
  end

  test "add" do
    num1 = TrustedNumber.new("100", base: 2)
    num2 = TrustedNumber.new("101", base: 2)
    num3 = TrustedNumber.new("1001", base: 2)
    assert_equal(num3, num1 + num2)

    num1 = TrustedNumber.new("0.01")
    num2 = TrustedNumber.new("0.10")
    num3 = TrustedNumber.new("0.11")
    assert_equal(num3, num1 + num2)

    num1 = TrustedNumber.new("0111")
    num2 = TrustedNumber.new("0001")
    num3 = TrustedNumber.new("1000")
    assert_equal(num3, num1 + num2)

    num1 = TrustedNumber.new("11.11")
    num2 = TrustedNumber.new(".01")
    num3 = TrustedNumber.new("100.0")
    assert_equal(num3, num1 + num2)
  end
end
