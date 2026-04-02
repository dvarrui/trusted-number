# frozen_string_literal: true

class TrustedNumber

  def down_exp_to!(new_exp)
    return if @exp <= new_exp
    while @exp > new_exp
      @mant += ZERO
      @exp -= 1
    end
    true
  end

  def up_exp_to!(new_exp)
    return if @exp >= new_exp
    while @exp < new_exp
      if @mant.end_with? ZERO
        @mant = @mant[0..-2]
        @exp += 1
      else
        return false
      end
    end
    true
  end

  def move_exp_to!(new_exp)
    if @exp > new_exp
      down_exp_to!(new_exp)
    elsif @exp < new_exp
      up_exp_to!(new_exp)
    end
  end
end
