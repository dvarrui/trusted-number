# frozen_string_literal: true

class TrustedNumber

  def move_dot(option)
    if option.is_a? Integer
      desp_exp(-option)
    else
      puts option
    end
  end

  def desp_exp(desp)
    int = @int.chars
    frac = @frac.chars

    @exp += desp
    if desp < 0
      # down exp and move dot to left
      frac += [ZERO] * desp.abs
      desp.abs.times { int.append(frac.shift) }
    elsif desp > 0
      # up exp and move dot to right
      int = [ZERO] * desp + int
      desp.times { frac.unshift(int.pop) }
    end

    @int = int.join
    @frac = frac.join
    clean
  end
end
