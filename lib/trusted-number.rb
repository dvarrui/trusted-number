# frozen_string_literal: true

require_relative "trusted-number/version"
require_relative "trusted-number/add"

class TrustedNumber
  attr_reader :base
  attr_reader :prenumber, :postnumber

  DIGITS = "0123456789abcdefghijklmnopqrstuvwxyz"

  def initialize(number, base: 10)
    @number = number
    @base = base

    num_str = @number.to_s.downcase.delete(' ')
    pre, post = num_str.split('.')
    @prenumber = pre || "0"
    @postnumber = post || ""
    
    validate_format!
  end

  def value
    @postnumber.empty? ? @prenumber : "#{@prenumber}.#{@postnumber}"
  end

  def to_s
    "TrustedNumber: #{value} (base: #{@base})"
  end

  private

  def build_result(pre, post)
    pre_clean = pre.gsub(/^0+(?=\d)/, '')
    post_clean = post.gsub(/0+$/, '')
    str = post_clean.empty? ? pre_clean : "#{pre_clean}.#{post_clean}"
    TrustedNumber.new(str, base: @base)
  end

  def validate_format!
    allowed = DIGITS[0...@base]
    pattern = /\A[#{allowed}]*\z/
    unless @prenumber.match?(pattern) && @postnumber.match?(pattern)
      raise ArgumentError, "Caracteres inválidos para base #{@base}"
    end
  end
end
