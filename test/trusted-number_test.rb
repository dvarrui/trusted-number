# frozen_string_literal: true

require "test_helper"

class TrustedNumberTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::TrustedNumber.const_defined?(:VERSION)
    end
  end

  test "equal" do
    bin1 = TrustedNumber.new("101.01", base: 2)
    assert(bin1.value == "101.01")
  end

  test "add base 2" do
    bin1 = TrustedNumber.new("101.01", base: 2)
    bin2 = TrustedNumber.new("100.11", base: 2)
    bin3 = TrustedNumber.new("110.00", base: 2)

    assert_equal(bin3, bin1 + bin2)
  end

  test "add base 10" do
    dec1 = TrustedNumber.new("0.1")
    dec2 = TrustedNumber.new("0.2")
    dec3 = TrustedNumber.new("0.3")

    assert_equal(dec3, dec1 + dec2)
  end
end
