# frozen_string_literal: true

require "test-unit"

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "trusted-number"

module TrustedNumbersSetup
  def setup_base2
    @zero = TrustedNumber.new("0", base: 2)
    @num1 = TrustedNumber.new("101.001", base: 2)
    @num2 = TrustedNumber.new("101", base: 2)
    @num3 = TrustedNumber.new("0.001", base: 2)
  end

  def setup_base10
    @zero = TrustedNumber.new("0")
    @num1 = TrustedNumber.new("123.456")
    @num2 = TrustedNumber.new("123")
    @num3 = TrustedNumber.new("0.456")
  end
end
