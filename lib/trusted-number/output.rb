# frozen_string_literal: true

class TrustedNumber

  def about
    "TrustedNumber: #{to_s}|base:#{@base}|sign:#{@sign}|mant:#{@mant}|exp:#{@exp}"
  end

  def negative?
    @sign == NEGATIVE
  end

  def positive?
    !negative?
  end

  def to_s
    sign = (@sign == POSITIVE) ? "" : @sign

    number = @mant.dup
    if @exp > 0
      size = @mant.length * @exp
      number = @mant.ljust(size, ZERO)
    elsif @exp.negative?
      desp = @mant.length + @exp
      if desp <= 0
        number = ZERO + (ZERO * desp.abs) + number
        desp = number.length + @exp
        index = -desp - 1
        number.insert(index - 1, DOT)
      else
        # desp = number.length + @exp
        index = desp
        number.insert(index, DOT)
        number = clean_trailing_postzeros(number)
      end
    end
    base = "(b#{@base})"
    base = "" if @base == 10
    "#{sign}#{number.upcase}#{base}"
  end
end
