# frozen_string_literal: true

require_relative "trusted-number/version"
require_relative "trusted-number/add"
require_relative "trusted-number/equal"
require_relative "trusted-number/sub"
require_relative "trusted-number/mul"

class TrustedNumber
  attr_reader :base
  attr_reader :predot, :postdot

  DIGITS = "0123456789abcdefghijklmnopqrstuvwxyz"

  def initialize(number, base: 10)
    @number = number
    @base = base

    num_str = @number.to_s.downcase.delete(" ")
    pre, post = num_str.split(".")
    @predot = pre || "0"
    @postdot = post || ""

    validate_format!
  end

  def value
    @postdot.empty? ? @predot : "#{@predot}.#{@postdot}"
  end

  def to_s
    "TrustedNumber: #{value} (base: #{@base})"
  end

  private

  def build_result(pre, post)
    pre_clean = pre.gsub(/^0+(?=\d)/, "")
    post_clean = post.gsub(/0+$/, "")
    str = post_clean.empty? ? pre_clean : "#{pre_clean}.#{post_clean}"
    TrustedNumber.new(str, base: @base)
  end

  def validate_format!
    allowed = DIGITS[0...@base]
    pattern = /\A[#{allowed}]*\z/
    unless @predot.match?(pattern) && @postdot.match?(pattern)
      raise ArgumentError, "Caracteres inválidos para base #{@base}"
    end
  end
end
