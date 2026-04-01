# frozen_string_literal: true

require "test_helper"

class Base2CompareTest < Test::Unit::TestCase
  include TrustedNumbersSetup

  def setup
    setup_base2
  end

  test "base" do
    assert(@num1.base == 2)
    assert(@num2.base == 2)
    assert(@num3.base == 2)
  end

  test "value" do
    assert(@num1.value == "101.001(b2)")
    assert(@num2.value == "101(b2)")
    assert(@num3.value == "0.001(b2)")
  end

  test "equal" do
    assert(@num1 == TrustedNumber.new("101.001", base: 2))
    assert(@num1 == TrustedNumber.new("0101.001", base: 2))
    assert(@num1 == TrustedNumber.new("0101.0010", base: 2))
    assert(@num1 == TrustedNumber.new("101.0010", base: 2))

    assert(@num2 == TrustedNumber.new("101", base: 2))
    assert(@num2 == TrustedNumber.new("0101", base: 2))
    assert(@num2 == TrustedNumber.new("0101", base: 2))
    assert_equal(@num2.about, TrustedNumber.new("101.0", base: 2).about)

    assert(@num3 == TrustedNumber.new(".001", base: 2))
    assert(@num3 == TrustedNumber.new("0.001", base: 2))
    assert(@num3 == TrustedNumber.new("0.0010", base: 2))
    assert(@num3 == TrustedNumber.new(".0010", base: 2))
  end
end
