# frozen_string_literal: true

require "debug"

require_relative "trusted-number/attr"
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

  attr_reader :str_number
  attr_accessor :sign, :base
  attr_accessor :int, :frac, :exp

  def initialize(str_number = ZERO, base: 10, exp: 0)
    @str_number = str_number.to_s.downcase.strip
    @base = base
    @exp = exp

    if str_number == ZERO
      @sign = POSITIVE
      @int = ZERO
      @frac = ZERO
    else
      Load.new(self).from_str(@str_number)
    end
  end

  def positive? = @sign == POSITIVE
  def negative? = @sign == NEGATIVE
  def zero? = @int == ZERO && @frac == ZERO

  def is_valid?
    allowed = DIGITS[0...@base]
    pattern = /\A[#{allowed}]*\z/
    str_number = "#{@int}#{DOT}#{@frac}"
    unless str_mumber.match?(pattern)
      warn "Invalid chars (base #{@base})"
      return false
    end
    true
  end

  def clean
    clean_leading_zeros
    clean_trailing_zeros
  end

  private


  def clean_leading_zeros
    digits = @int.chars
    while digits.first == TrustedNumber::ZERO && digits.length > 1
      digits.delete_at 0
    end
    @int = digits.join
  end

  def clean_trailing_zeros
    digits = @frac.chars
    while digits.last == TrustedNumber::ZERO && digits.length > 1
      digits.delete_at -1
    end
    @frac = digits.join
  end
end

TNumber = TrustedNumber
