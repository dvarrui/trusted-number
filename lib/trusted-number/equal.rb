class TrustedNumber
  def ==(other)
    cond = (@base == other.base)
    cond &&= (@predot == other.predot)
    cond &&= (@postdot == other.postdot)

    cond
  end
  alias_method :equal?, :==
end
