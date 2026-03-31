# frozen_string_literal: true

require "test_helper"

class Base10PrePostTest < Test::Unit::TestCase
  include TrustedNumbersSetup

  def setup
    setup_base10
  end

  test "predot" do
    assert(@num1.predot == "123")
    assert(@num1.postdot == "456")

    assert(@num2.predot == "123")
    assert(@num2.postdot == "0")

    assert(@num3.predot == "0")
    assert(@num3.postdot == "456")
  end
end
