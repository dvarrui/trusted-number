# frozen_string_literal: true

require "test_helper"

class Base10SumTest < Test::Unit::TestCase
  include TrustedNumbersSetup

  def setup
    setup_base10
  end

  test "add" do
    num1 = TrustedNumber.new("4")
    num2 = TrustedNumber.new("5")
    num3 = TrustedNumber.new("9")
    assert_equal(num3, num1 + num2)

    num1 = TrustedNumber.new("0.1")
    num2 = TrustedNumber.new("0.2")
    num3 = TrustedNumber.new("0.3")
    assert_equal(num3, num1 + num2)

    num1 = TrustedNumber.new("99")
    num2 = TrustedNumber.new("1")
    num3 = TrustedNumber.new("100")
    assert_equal(num3, num1 + num2)

    num1 = TrustedNumber.new("99.99")
    num2 = TrustedNumber.new(".01")
    num3 = TrustedNumber.new("100.0")
    assert_equal(num3, num1 + num2)
  end
end
