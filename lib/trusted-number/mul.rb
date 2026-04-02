# frozen_string_literal: true

class TrustedNumber
  def *(other)
    # Algoritmo: Multiplicar como si no hubiera puntos, luego posicionar punto
    s1 = @prenumber + @postnumber
    s2 = other.prenumber + other.postnumber

    # Multiplicación de strings (suma de productos parciales)
    res_int = multiply_strings(s1, s2, @base)

    # Posicionar el punto decimal
    total_decimals = @postnumber.length + other.postnumber.length

    if total_decimals > 0
      # Asegurar que el string sea lo bastante largo
      res_int = res_int.rjust(total_decimals + 1, "0")
      new_pre = res_int[0...-total_decimals]
      # new_post = res_int[-total_decimals..-1]
      new_post = res_int[-total_decimals..]
    else
      new_pre, new_post = res_int, ""
    end

    build_result(new_pre, new_post)
  end

  private

  def multiply_strings(s1, s2, base)
    # Multiplicación básica (Long Multiplication) carácter a carácter
    product = Array.new(s1.length + s2.length, 0)

    (s1.length - 1).downto(0) do |i|
      (s2.length - 1).downto(0) do |j|
        mul = DIGITS.index(s1[i]) * DIGITS.index(s2[j])
        sum = mul + product[i + j + 1]
        product[i + j + 1] = sum % base
        product[i + j] += sum / base
      end
    end
    product.map { |d| DIGITS[d] }.join.gsub(/^0+(?=\d)/, "")
  end
end
