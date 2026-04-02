# frozen_string_literal: true

require_relative "trusted-number/add"
require_relative "trusted-number/compare"
require_relative "trusted-number/mul"
require_relative "trusted-number/subtract"
require_relative "trusted-number/version"

class TrustedNumber
  attr_reader :base, :sign, :mant, :exp

  DIGITS = "0123456789abcdefghijklmnopqrstuvwxyz"
  ZERO = "0"
  DOT = "."
  POSITIVE = "+"
  NEGATIVE = "-"

  def self.factory(base)
    unless base == base.to_i || base < 1
      raise ArgumentError, "Invalid base (Natural number > 1)"
    end

    ->(number) { new(number, base: base) }
  end

  def initialize(number, base: 10)
    @number = number.to_s.strip
    @base = base

    read_attibutes(@number)
  end

  def about
    "TrustedNumber: #{value}|base:#{@base}|sign:#{@sign}|mant:#{@mant}|exp:#{@exp}"
  end

  def negative?
    @sign == NEGATIVE
  end

  def positive?
    !negative?
  end

  def to_s
    value
  end

  def value
    sign = (@sign == POSITIVE) ? "" : @sign

    if @exp.zero?
      number = @mant.dup
    elsif @exp.positive?
      size = @mant.length * @exp
      number = @mant.ljust(size, ZERO)
    else
      number = @mant.dup.insert(@exp - 1, DOT)
    end
    base = "(b#{@base})"
    base = "" if @base == 10
    "#{sign}#{number.upcase}#{base}"
  end

  private

  def create_new_tnumber(pre, post)
    pre_clean = pre.gsub(/^0+(?=\d)/, "")
    pre_clean = ZERO if pre_clean.empty?

    post_clean = post.gsub(/0+$/, "")
    str_number = post_clean.empty? ? pre_clean : "#{pre_clean}.#{post_clean}"
    TrustedNumber.new(str_number, base: @base)
  end

  def read_attibutes(number)
    num_str = number.to_s.downcase.delete(" ")
    num_str = read_sign(num_str)
    num_str = read_exp(num_str)
    read_mant(num_str)
    validate_format
  end

  def read_sign(number)
    @sign = POSITIVE
    if number.start_with?(NEGATIVE)
      @sign = NEGATIVE
      number = number[1..]
    elsif number.start_with?(POSITIVE)
      number = number[1..]
    end
    number
  end

  def read_exp(number)
    if number.index(DOT).nil?
      @exp = 0
    else
      dotpos = number.length - 1 - number.index(DOT)
      @exp = - dotpos
    end
    number.delete(DOT)
  end

  def read_mant(number)
    mant = number.gsub(/^0+(?=\d)/, "")
    mant = ZERO if mant.empty?
    @mant = mant
  end

  def validate_format
    allowed = DIGITS[0...@base]
    pattern = /\A[#{allowed}]*\z/
    unless @mant.match?(pattern)
      raise ArgumentError, "Invalid chars (base #{@base})"
    end
  end
end

TNumber = TrustedNumber
