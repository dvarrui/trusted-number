class TrustedNumber
  include Comparable

  def ==(other)
    cond = (@base == other.base)
    cond &&= (@predot == other.predot)
    cond &&= (@postdot == other.postdot)

    cond
  end
  alias_method :equal?, :==
  alias_method :eq?, :==

  def <=>(other)
    return nil unless other.is_a?(TrustedNumber)
    return 0 if about == other.about

    # compare sign
    return 1 if positive? && other.negative?
    return -1 if negative? && other.positive?

    # compare predot
    max_pre = [@predot.length, other.predot.length].max
    s1_pre = @predot.rjust(max_pre, "0")
    s2_pre = other.predot.rjust(max_pre, "0")

    return s1_pre <=> s2_pre if s1_pre != s2_pre

    # compare postdot
    max_post = [@postdot.length, other.postdot.length].max
    s1_post = @postdot.ljust(max_post, "0")
    s2_post = other.postdot.ljust(max_post, "0")

    s1_post <=> s2_post
  end

  alias_method :lt?, :<
  alias_method :gt?, :>
end
