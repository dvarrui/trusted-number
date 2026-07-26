# frozen_string_literal: true

class TrustedNumber

  def move_dot(option)
    if option.is_a? Integer
      desp_exp(-option)
    elsif option == :left
      desp_exp(@int.length)
    elsif option == :right
      desp_exp(-@frac.length)
    elsif option == :sci
      desp_exp(@int.length-1)
    elsif option == :original
      d = @int.length - @original_dot_index
      desp_exp(d)
    else
      puts "Unkown option! (#{option})"
    end
    self
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
