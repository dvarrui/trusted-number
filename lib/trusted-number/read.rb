# frozen_string_literal: true

class TrustedNumber
  private

  def read_attibutes(input)
    num = input.delete(" ")
    num = read_sign(num)
    num = clean_unused_digits(num)
    num = read_exp(num)
    read_mant(num)
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

  def clean_unused_digits(number)
    clean = number.gsub(/^0+(?=\d)/, "")
    clean = clean.gsub(/0+$/, "")
    clean = ZERO if clean.empty?
    clean
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
