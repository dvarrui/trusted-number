class TrustedNumber
  def +(other)
    # aligne exp
    min_exp = [exp, other.exp].min
    move_exp_to!(min_exp)
    other.move_exp_to!(min_exp)

    # aligne mant
    max_mant = [@mant.length, other.mant.length].max
    mant1 = @mant.ljust(max_mant, ZERO)
    mant2 = other.mant.ljust(max_mant, ZERO)

    mant3 = add_strings(mant1, mant2, @base)

    create_new_tnumber(mant3, min_exp)
  end
  alias_method :add, :+

  private

  def add_strings(s1, s2, base)
    carry = 0
    res = []
    i, j = s1.length - 1, s2.length - 1
    while i >= 0 || j >= 0
      v1 = (i >= 0) ? DIGITS.index(s1[i]) : 0
      v2 = (j >= 0) ? DIGITS.index(s2[j]) : 0
      sum = v1 + v2 + carry
      res << DIGITS[sum % base]
      carry = sum / base
      i -= 1
      j -= 1
    end
    if carry > 0
      res << DIGITS[carry % base]
    end
    res.reverse.join
  end
end
