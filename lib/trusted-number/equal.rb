class TrustedNumber
  def ==(other)
    cond = (@base == other.base)
    cond &&= (@predot = other.predot)
    cond &&= (@posdot = other.postdot)

    cond
  end
end
