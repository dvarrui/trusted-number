# frozen_string_literal: true

require_relative "trusted-number/add"
require_relative "trusted-number/compare"
require_relative "trusted-number/exp"
require_relative "trusted-number/load"
require_relative "trusted-number/mul"
require_relative "trusted-number/output"
require_relative "trusted-number/subtract"
require_relative "trusted-number/version"

class TrustedNumber
  attr_reader :base, :sign, :mant, :exp

  def self.factory(base)
    unless base == base.to_i || base < 1
      raise ArgumentError, "Invalid base (Natural number > 1)"
    end

    ->(number) { new(number, base: base) }
  end

  def initialize(number, base: 10, exp: 0)
    @number = number.to_s.downcase.strip
    @base = base

    load_attibutes(@number)
    @exp += exp
  end

  private

  def create_new_tnumber(mant, exp)
    TrustedNumber.new(mant, base: @base, exp: exp)
  end
end

TNumber = TrustedNumber
