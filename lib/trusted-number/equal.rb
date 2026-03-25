class TrustedNumber
  def ==(other)
    cond = (@base == other.base)
    cond &&= (@prenumber = other.prenumber)
    cond &&= (@postnumber = other.postnumber)

    cond
  end
end
