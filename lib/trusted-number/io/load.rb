# frozen_string_literal: true

class TrustedNumber

  class Load
    attr_reader :sign, :int, :frac

    def from_str(str_number)
      digits = str_number.chars

      load_sign(digits)
      load_int_and_frac(digits)
    end

    def load_sign(digits)
      if digits.first == TrustedNumber::NEGATIVE
        @sign = TrustedNumber::NEGATIVE
        digits.delete_at 0
      elsif digits.first == TrustedNumber::POSITIVE
        @sign = TrustedNumber::POSITIVE
        digits.delete_at 0
      else
        @sign = TrustedNumber::POSITIVE
      end
    end

    def load_int_and_frac(digits)
      dot_index = digits.index TrustedNumber::DOT
      if dot_index.nil?
        @int = digits.join
        @frac = ZERO
      elsif dot_index.zero?
        @int = ZERO
        @frac = digits.join
      else
        @int = digits[0..(dot_index - 1)].join
        @frac = digits[(dot_index + 1)..].join
      end
    end
  end
end
