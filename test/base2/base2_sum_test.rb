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
