# frozen_string_literal: true

require "test_helper"

class TrustedNumberTest < Test::Unit::TestCase
  def setup
    @bin1 = TrustedNumber.new("101.01", base: 2)
    @bin2 = TrustedNumber.new("100.11", base: 2)
    @bin3 = TrustedNumber.new("110.00", base: 2)
  end

  test "VERSION" do
    assert do
      ::TrustedNumber.const_defined?(:VERSION)
    end
  end

  test "equal" do
    assert(@bin1.value == "101.01")
  end

  test "add base 2" do
    assert_equal(@bin3, @bin1 + @bin2)
  end
end
