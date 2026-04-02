# frozen_string_literal: true

require "test_helper"

class Base10AliasTest < Test::Unit::TestCase
  test "string" do
    num = TNumber.new("-012.340")

    assert_equal "-", num.sign
    assert_equal "12", num.predot
    assert_equal "34", num.postdot

    assert_equal "TrustedNumber", num.class.to_s
  end

  test "int" do
    num = TNumber.new(-12)

    assert_equal "-", num.sign
    assert_equal "12", num.predot
    assert_equal "0", num.postdot

    assert_equal "TrustedNumber", num.class.to_s
  end

  test "float" do
    num = TNumber.new(-12.34)

    assert_equal "-", num.sign
    assert_equal "12", num.predot
    assert_equal "34", num.postdot

    assert_equal "TrustedNumber", num.class.to_s
  end
end
