class TrustedNumber
  def -(other)
    # align post
    max_post = [@postdot.length, other.postdot.length].max
    p1 = @postdot.ljust(max_post, ZERO)
    p2 = other.postdot.ljust(max_post, ZERO)

    res_post, borrow = subtract_strings(p1, p2, @base)

    # 3. Restar prenumbers - borrow
    res_pre, _ = sub_strings(@prenumber, other.prenumber, @base, borrow)

    create_new_tnumber(res_pre, res_post)
  end
  alias_method :subtract, :-

  private

  def subtract_strings(s1, s2, base, borrow = 0)
    res = ""
    i, j = s1.length - 1, s2.length - 1
    while i >= 0 || j >= 0
      v1 = (i >= 0) ? DIGITS.index(s1[i]) : 0
      v2 = ((j >= 0) ? DIGITS.index(s2[j]) : 0) + borrow
      if v1 < v2
        v1 += @base
        borrow = 1
      else
        borrow = 0
      end
      res << DIGITS[v1 - v2]
      i -= 1
      j -= 1
    end
    [res.reverse, borrow]
  end
end
