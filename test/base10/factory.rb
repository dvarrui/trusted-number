# frozen_string_literal: true

require "test_helper"

class Base10FactoryTest < Test::Unit::TestCase
  test "base is natural number" do
    assert_raise do
      TrustedNumber.factory(1.5)
    end
    assert_raise do
      TrustedNumber.factory(-10)
    end
    assert_raise do
      TrustedNumber.factory(1)
    end
  end

  test "base 2" do
    b2 = TrustedNumber.factory(2)

    num1 = b2.call(-101)
    assert_equal "-", num1.sign
    assert_equal "101", num1.predot
    assert_equal "0", num1.postdot

    num2 = b2.call("10.1")
    assert_equal "+", num2.sign
    assert_equal "10", num2.predot
    assert_equal "1", num2.postdot
  end

  test "base 10" do
    b10 = TrustedNumber.factory(10)

    num1 = b10.call(-16)
    assert_equal "-", num1.sign
    assert_equal "16", num1.predot
    assert_equal "0", num1.postdot

    num2 = b10.call(3.14)
    assert_equal "+", num2.sign
    assert_equal "3", num2.predot
    assert_equal "14", num2.postdot
  end
end
