# frozen_string_literal: true

class TrustedNumber

  def inspect
    "TrustedNumber: #{to_s}| base:#{@base}| sign:#{@sign}| int:#{@int}| frac:#{@frac}| exp:#{@exp}"
  end

  def to_s
    sign = (@sign == POSITIVE) ? "" : @sign

    number = "#{@int}#{DOT}#{@frac}"
    number = "#{@int}" if @frac == ZERO

    exp = "exp#{@exp}"
    exp = "" if @exp.zero?

    base = "(b#{@base})"
    base = "" if @base == 10
    "#{sign}#{number}#{exp} #{base}"
  end
end
