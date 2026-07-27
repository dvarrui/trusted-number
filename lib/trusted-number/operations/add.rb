class TrustedNumber
  def +(other)
    raise "Diferent bases!" unless @base == other.base
    other.desp_exp(@exp - other.exp) unless @exp == other.exp

    pre_zeros = [int.length, other.int.length].max
    post_zeros = [frac.length, other.frac.length].max
    mant_tn1 = self.mant(pre_zeros, post_zeros)
    mant_tn2 = other.mant(pre_zeros, post_zeros)
    mant_add = add_strings(mant_tn1, mant_tn2)

    TNumber.new(mant_add, base: @base, exp: @exp)
  end
  alias_method :add, :+

  private

  def add_strings(s1, s2)
    carry = 0
    res = []
    raise "PANIC" unless s1.length == s2.length
    index = s1.length - 1
    while index >= 0
      v1 = DIGITS.index(s1[index])
      v2 = DIGITS.index(s2[index])
      if v1.nil?
        res << DOT
      else
        sum = v1 + v2 + carry
        res << DIGITS[sum % base]
        carry = sum / base
      end
      index -= 1
    end
    if carry > 0
      res << DIGITS[carry % base]
    end
    res.reverse.join
  end
end
