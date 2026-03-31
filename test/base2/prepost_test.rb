# frozen_string_literal: true

require "test_helper"

class Base2PrePostTest < Test::Unit::TestCase
  include TrustedNumbersSetup

  def setup
    setup_base2
  end

  test "predot" do
    assert(@zero.predot == "0")
    assert(@zero.postdot == "0")

    assert(@num1.predot == "101")
    assert(@num1.postdot == "001")

    assert(@num2.predot == "101")
    assert(@num2.postdot == "0")

    assert(@num3.predot == "0")
    assert(@num3.postdot == "001")
  end
end
