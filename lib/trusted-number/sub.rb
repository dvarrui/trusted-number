class TrustedNumber
  def -(other)
    # 1. Alinear decimales
    max_post = [@postnumber.length, other.postnumber.length].max
    p1 = @postnumber.ljust(max_post, '0')
    p2 = other.postnumber.ljust(max_post, '0')

    # 2. Restar postnumbers (manejando el "pedir prestado" o borrow)
    res_post, borrow = sub_strings(p1, p2, @base)

    # 3. Restar prenumbers - borrow
    res_pre, _ = sub_strings(@prenumber, other.prenumber, @base, borrow)

    build_result(res_pre, res_post)
  end

  private

  def sub_strings(s1, s2, base, borrow = 0)
    res = ""
    i, j = s1.length - 1, s2.length - 1
    while i >= 0 || j >= 0
      v1 = i >= 0 ? DIGITS.index(s1[i]) : 0
      v2 = (j >= 0 ? DIGITS.index(s2[j]) : 0) + borrow
      if v1 < v2
        v1 += base
        borrow = 1
      else
        borrow = 0
      end
      res << DIGITS[v1 - v2]
      i -= 1; j -= 1
    end
    [res.reverse, borrow]
  end

end