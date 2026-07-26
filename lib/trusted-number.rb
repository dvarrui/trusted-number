# frozen_string_literal: true

# require "debug"

require_relative "trusted-number/exp"
require_relative "trusted-number/factory"
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

  attr_accessor :str_number
  attr_accessor :sign, :base
  attr_accessor :int, :frac, :exp

  def initialize(str_number = ZERO, base: 10, exp: 0)
    @base = base
    @exp = exp

    if str_number == ZERO
      @str_number = ZERO
      @sign = POSITIVE
      @int = ZERO
      @frac = ZERO
    else
      Load.new(self).from_str(str_number)
    end
  end

  def positive? = @sign == POSITIVE
  def negative? = @sign == NEGATIVE
  def zero? = @int == ZERO && @frac == ZERO
  def valid? = @valid

    def clean
    clean_leading_zeros
    clean_trailing_zeros
  end

  def check
    @valid = true
    allowed = DIGITS[0...@base] + DOT + POSITIVE + NEGATIVE
    pattern = /\A[#{allowed}]*\z/
    unless @str_number.match?(pattern)
      warn "Invalid content! (#{@str_number})"
      @valid = false
    end
  end

  private

  def clean_leading_zeros
    digits = @int.chars
    while digits.first == TrustedNumber::ZERO && digits.length > 1
      digits.delete_at 0
    end
    @int = digits.empty? ? ZERO: digits.join
  end

  def clean_trailing_zeros
    digits = @frac.chars
    while digits.last == TrustedNumber::ZERO && digits.length > 1
      digits.delete_at -1
    end
    @frac = digits.empty? ? ZERO: digits.join
  end
end

TNumber = TrustedNumber
