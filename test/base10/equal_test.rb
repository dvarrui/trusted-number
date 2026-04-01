# frozen_string_literal: true

require "test_helper"

class Base10EqualTest < Test::Unit::TestCase
  include TrustedNumbersSetup

  def setup
    setup_base10
  end

  test "new" do
    assert_equal(@zero.value, "0")
    assert_equal(@zero.base, 10)
    assert_equal(@zero.predot, "0")
    assert_equal(@zero.postdot, "0")

    assert_equal(@num1.value, "123.456")
    assert_equal(@num1.base, 10)
    assert_equal(@num1.predot, "123")
    assert_equal(@num1.postdot, "456")

    assert_equal(@num2.value, "123")
    assert_equal(@num2.base, 10)
    assert_equal(@num2.predot, "123")
    assert_equal(@num2.postdot, "0")

    assert_equal(@num3.value, "0.456")
    assert_equal(@num3.base, 10)
    assert_equal(@num3.predot, "0")
    assert_equal(@num3.postdot, "456")
  end

  test "equal" do
    assert(@zero == TrustedNumber.new("0.0"))
    assert(@zero == TrustedNumber.new("0."))
    assert(@zero == TrustedNumber.new(".0"))
    assert(@zero == TrustedNumber.new("."))

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

  test "not equal" do
    # refute_equal(@zero, TrustedNumber.new("0.1"))
    # assert(@num1 != @num2)

    # assert(TrustedNumber.new("0") != TrustedNumber.new("0", base: 2))
    # assert(TrustedNumber.new("1") != TrustedNumber.new("1", base: 2))
    # assert(TrustedNumber.new("10") != TrustedNumber.new("10", base: 2))
  end
end
