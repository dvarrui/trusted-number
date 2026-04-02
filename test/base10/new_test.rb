# frozen_string_literal: true

require "test_helper"

class Base10NewTest < Test::Unit::TestCase
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
end
