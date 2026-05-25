# frozen_string_literal: true

class TrustedNumber
  def predot
    @mant.split(DOT).first
  end

  def postdot
    @mant.split(DOT).second
  end

  def sign
    return "" if zero?
    return NEGATIVE if negative?
    POSITIVE
  end
end