# frozen_string_literal: true

require "test_helper"

class Base10EqualTest < Test::Unit::TestCase
  include TrustedNumbersSetup

  def setup
    setup_base10
  end

  test "new" do
    assert(@num1.value == "123.456")
    assert(@num1.base == 10)
    assert(@num2.value == "123")
    assert(@num2.base == 10)
    assert(@num3.value == "0.456")
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
end
