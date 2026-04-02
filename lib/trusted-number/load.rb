# frozen_string_literal: true

class TrustedNumber
  private

  def load_attibutes(input)
    num = input.delete(" ")
    num = clean_trailing_postzeros(num)
    num = load_sign(num)
    num = clean_trailing_prezeros(num)
    num = load_exp(num)
    load_mant(num)
    validate_format
  end

  def load_sign(number)
    @sign = POSITIVE
    if number.start_with?(NEGATIVE)
      @sign = NEGATIVE
      number = number[1..]
    elsif number.start_with?(POSITIVE)
      number = number[1..]
    end
    number
  end

  def clean_trailing_prezeros(str)
    clean = str.gsub(/^0+(?=\d)/, "")
    clean = ZERO if clean.empty?
    clean
  end

  def clean_trailing_postzeros(str)
    return str unless str.include?(".")
  
    clean = str.sub(/0+\z/, "").sub(/\.\z/, "")
    clean = ZERO if clean.empty?
    clean
  end

  def load_exp(number)
    if number.index(DOT).nil?
      @exp = 0
    else
      dotpos = number.length - 1 - number.index(DOT)
      @exp = - dotpos
    end
    number.delete(DOT)
  end

  def load_mant(number)
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
