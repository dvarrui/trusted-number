# frozen_string_literal: true

require_relative "trusted-number/add"
require_relative "trusted-number/compare"
require_relative "trusted-number/load"
require_relative "trusted-number/mul"
require_relative "trusted-number/subtract"
require_relative "trusted-number/version"
require "debug"

class TrustedNumber
  attr_reader :base, :sign, :mant, :exp

  def self.factory(base)
    unless base == base.to_i || base < 1
      raise ArgumentError, "Invalid base (Natural number > 1)"
    end

    ->(number) { new(number, base: base) }
  end

  def initialize(number, base: 10)
    @number = number.to_s.downcase.strip
    @base = base

    load_attibutes(@number)
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

    number = @mant.dup
    if @exp > 0
      size = @mant.length * @exp
      number = @mant.ljust(size, ZERO)
    elsif @exp.negative?
      desp = @mant.length + @exp
      if desp <= 0
        number = ZERO + (ZERO * desp) + number
      end
      desp = number.length + @exp
      index = -desp
      number.insert(index - 1, DOT)
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
end

TNumber = TrustedNumber
