# frozen_string_literal: true

class TrustedNumber

  class Load
    def initialize(tnumber=nil)
      if tnumber.nil?
        @tnumber = TrustedNumber.new
      else
        @tnumber = tnumber
      end
    end

    def from_string(input)
      binding.break
      data = input.delete(" ")
      data = Load.clean_trailing_zeros(data)
      load_sign(data)
      data = Load.clean_leading_zeros(data)
      # data = load_exp(data)
      # load_mant(data)
      @tnumber.mant = data
      @tnumber
    end

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
  
    def self.clean_leading_zeros(str)
      clean = str.gsub(/^0+(?=\d)/, "")
      clean = ZERO if clean.empty?
      clean
    end
  
    def self.clean_trailing_zeros(str)
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
