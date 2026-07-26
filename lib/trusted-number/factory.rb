class TrustedNumber
  def self.factory(base)
    unless base == base.to_i || base < 1
      raise ArgumentError, "Invalid base (Natural number > 1)"
    end

    ->(str_number) { new(str_number, base: base) }
  end
end
