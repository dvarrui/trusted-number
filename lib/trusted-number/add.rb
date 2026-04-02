class TrustedNumber
  def +(other)
    # Aligne numbers

    max_post = [@postdot.length, other.postdot.length].max
    p1 = @postdot.ljust(max_post, "0")
    p2 = other.postdot.ljust(max_post, "0")

    res_post, carry = add_strings(p1, p2, @base)

    # Sum predot + carry
    res_pre, final_carry = add_strings(@predot, other.predot, @base, carry)
    res_pre = DIGITS[final_carry] + res_pre if final_carry > 0

    create_new_tnumber(res_pre, res_post)
  end
  alias_method :add, :+

  private

  def add_strings(s1, s2, base, carry = 0)
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
    [res.reverse.join, carry]
  end
end
