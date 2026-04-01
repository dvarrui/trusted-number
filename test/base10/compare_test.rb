# frozen_string_literal: true

require "test_helper"

class Base10CompareTest < Test::Unit::TestCase
  include TrustedNumbersSetup

  def setup
    setup_base10
  end

  test "base symbols" do
    assert_raise do
      TrustedNumber.new("12a")
    end
  end

  test "new" do
    assert_equal("0", @zero.value)
    assert_equal(10, @zero.base)
    assert_equal("0", @zero.predot)
    assert_equal("0", @zero.postdot)

    assert_equal("123.456", @num1.value)
    assert_equal(10, @num1.base)
    assert_equal("123", @num1.predot)
    assert_equal("456", @num1.postdot)

    assert_equal("123", @num2.value)
    assert_equal(10, @num2.base)
    assert_equal("123", @num2.predot)
    assert_equal("0", @num2.postdot)

    assert_equal(@num3.value, "0.456")
    assert_equal(@num3.base, 10)
    assert_equal(@num3.predot, "0")
    assert_equal(@num3.postdot, "456")
  end

  test "equal" do
    assert_equal(@zero.about, TrustedNumber.new("0.0").about)
    assert_equal(@zero.about, TrustedNumber.new("0.").about)
    assert_equal(@zero.about, TrustedNumber.new(".0").about)
    assert_equal(@zero.about, TrustedNumber.new(".").about)

    assert_equal(@num1.about, TrustedNumber.new("123.456").about)
    assert_equal(@num1.about, TrustedNumber.new("0123.456").about)
    assert_equal(@num1.about, TrustedNumber.new("0123.4560").about)
    assert_equal(@num1.about, TrustedNumber.new("123.4560").about)

    assert_equal(@num2.about, TrustedNumber.new("123").about)
    assert_equal(@num2.about, TrustedNumber.new("0123").about)
    assert_equal(@num2.about, TrustedNumber.new("0123.0").about)
    assert_equal(@num2.about, TrustedNumber.new("123.0").about)

    assert_equal(@num3.about, TrustedNumber.new(".456").about)
    assert_equal(@num3.about, TrustedNumber.new("0.456").about)
    assert_equal(@num3.about, TrustedNumber.new("0.4560").about)
    assert_equal(@num3.about, TrustedNumber.new(".4560").about)
  end

  test "not equal" do
    cond = TrustedNumber.new("0") == TrustedNumber.new("0", base: 2)
    assert_false(cond)

    assert_false(TrustedNumber.new("1") == TrustedNumber.new("1", base: 2))
    assert_false(TrustedNumber.new("10") == TrustedNumber.new("10", base: 2))

    assert_false(@zero == TrustedNumber.new("0.1"))
    assert_false(@num1 == @num2)
  end

  test "less" do
    assert_true(@zero < @num1)
    assert_true(@zero < @num2)
    assert_true(@zero < @num3)

    assert_true(@num2 < @num1)
    assert_true(@num3 < @num1)

    assert_true(@num3 < @num2)
  end

  test "no less" do
    assert_false(@zero > @num1)
    assert_false(@zero > @num2)
    assert_false(@zero > @num3)

    assert_false(@num2 > @num1)
    assert_false(@num3 > @num1)

    assert_false(@num3 > @num2)
  end

  test "greater" do
    assert_true(@num1 > @zero)
    assert_true(@num1 > @num2)
    assert_true(@num1 > @num3)

    assert_true(@num2 > @zero)
    assert_true(@num2 > @num3)

    assert_true(@num3 > @zero)
  end
end
