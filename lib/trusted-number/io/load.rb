# frozen_string_literal: true

class TrustedNumber

  class Load
    def initialize(tnumber = nil)
      @tnumber = tnumber
      @tnumber = TrustedNumber.new if tnumber.nil?
    end

    def from_str(str_number)
      @tnumber.str_number = str_number.to_s.downcase.strip
      @tnumber.check
      digits = @tnumber.str_number.chars

      load_sign(digits)
      load_int_and_frac(digits)
      @tnumber.clean
      @tnumber
    end

    def load_sign(digits)
      if digits.first == TrustedNumber::NEGATIVE
        @tnumber.sign = TrustedNumber::NEGATIVE
        digits.delete_at 0
      elsif digits.first == TrustedNumber::POSITIVE
        @tnumber.sign = TrustedNumber::POSITIVE
        digits.delete_at 0
      else
        @tnumber.sign = TrustedNumber::POSITIVE
      end
    end

    def load_int_and_frac(digits)
      dot_index = digits.index TrustedNumber::DOT
      if dot_index.nil?
        @tnumber.int = digits.join
        @tnumber.frac = ZERO
      elsif dot_index.zero?
        @tnumber.int = ZERO
        @tnumber.frac = digits.join
      else
        @tnumber.int = digits[0..(dot_index - 1)].join
        @tnumber.frac = digits[(dot_index + 1)..].join
      end
    end
  end
end
