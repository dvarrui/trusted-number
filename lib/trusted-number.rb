# frozen_string_literal: true

require "debug"

require_relative "trusted-number/attr"
require_relative "trusted-number/version"

require_relative "trusted-number/io/load"
require_relative "trusted-number/io/output"
require_relative "trusted-number/operations/main"

class TrustedNumber
  DIGITS = "0123456789abcdefghijklmnopqrstuvwxyz"
  ZERO = "0"
  DOT = "."
  POSITIVE = "+"
  NEGATIVE = "-"

  attr_reader :number
  attr_accessor :base, :mant, :exp
  attr_accessor :positive

  def self.factory(base)
    unless base == base.to_i || base < 1
      raise ArgumentError, "Invalid base (Natural number > 1)"
    end

    ->(number) { new(number, base: base) }
  end

  def initialize(number = ZERO, base: 10, exp: 0)
    @number = number.to_s.downcase.strip
    @base = base
    @positive = true

    Load.new(self).from_string(@number)
    @exp += exp
  end

  def positive? = @positive
  def negative? = !@positive
  def zero? = @mant == 0

  def is_valid?
    allowed = DIGITS[0...@base]
    pattern = /\A[#{allowed}]*\z/
    unless @mant.match?(pattern)
      warn "Invalid chars (base #{@base})"
      return false
    end
    true
  end

  private

  def create_new_tnumber(mant, exp)
    new(mant, base: @base, exp: exp)
  end

  def move_point(desp)
    return if desp.zero?

    if desp > 0

    else
    end
  end
end

TNumber = TrustedNumber
