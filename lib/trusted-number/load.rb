# frozen_string_literal: true

class TrustedNumber

  class Load
    def initialize(tnumber)
      @tnumber = tnumber
    end

    def from_string(input)
      data = input.delete(" ")
      data = clean_trailing_zeros(data)
      load_sign(data)
      data = clean_leadingzeros(data)
      data = load_exp(data)
      load_mant(data)
      @tnumber
    end
  
    private

    def load_sign(number)
      @tnumber.positive = true
      if number.start_with?(NEGATIVE)
        @tnumber.positive = false
        number = number[1..]
      elsif number.start_with?(POSITIVE)
        number = number[1..]
      end
      number
    end
  
    def clean_leading_zeros(str)
      clean = str.gsub(/^0+(?=\d)/, "")
      clean = ZERO if clean.empty?
      clean
    end
  
    def clean_trailing_zeros(str)
      return str unless str.include?(".")
    
      clean = str.sub(/0+\z/, "").sub(/\.\z/, "")
      clean = ZERO if clean.empty?
      clean
    end
  
    def load_exp(number)
      if number.index(DOT).nil?
        @tnumber.exp = 0
      else
        dotpos = number.length - 1 - number.index(DOT)
        @tnumber.exp = - dotpos
      end
      number.delete(DOT)
    end
  
    def load_mant(number)
      mant = number.gsub(/^0+(?=\d)/, "")
      mant = ZERO if mant.empty?
      @tnumber.mant = mant
    end
  end
end
