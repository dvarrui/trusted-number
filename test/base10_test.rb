# frozen_string_literal: true

require "test_helper"

class Base10Test < Test::Unit::TestCase
  def setup
    @num1 = TrustedNumber.new("123.456")
    @num2 = TrustedNumber.new("123")
    @num3 = TrustedNumber.new(".456")
  end

  test "new" do
    assert(@num1.value == "123.456")
    assert(@num1.base == 10)
    assert(@num2.value == "123")
    assert(@num2.base == 10)
    assert(@num3.value == ".456")
    assert(@num3.base == 10)
  end

  test "equal" do
    assert(@num1 == TrustedNumber.new("123.456"))
    assert(@num1 == TrustedNumber.new("0123.456"))
    assert(@num1 == TrustedNumber.new("0123.4560"))
    assert(@num1 == TrustedNumber.new("123.4560"))

    assert(@num2 == TrustedNumber.new("123"))
    assert(@num2 == TrustedNumber.new("0123"))
    assert(@num2 == TrustedNumber.new("0123.0"))
    assert(@num2 == TrustedNumber.new("123.0"))

    assert(@num3 == TrustedNumber.new(".456"))
    assert(@num3 == TrustedNumber.new("0.456"))
    assert(@num3 == TrustedNumber.new("0.4560"))
    assert(@num3 == TrustedNumber.new(".4560"))
  end

  test "add" do
    dec1 = TrustedNumber.new("4")
    dec2 = TrustedNumber.new("5")
    dec3 = TrustedNumber.new("9")

    assert_equal(dec3, dec1 + dec2)

    dec1 = TrustedNumber.new("0.1")
    dec2 = TrustedNumber.new("0.2")
    dec3 = TrustedNumber.new("0.3")

    assert_equal(dec3, dec1 + dec2)
  end
end
