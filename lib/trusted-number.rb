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
  ZERO = "0"
  DOT = "."

  def initialize(number, base: 10)
    @number = number
    @base = base

    fill_pre_and_post
    validate_format
  end

  def value
    return @predot if @postdot == ZERO

    "#{@predot}#{DOT}#{@postdot}"
  end

  def to_s
    "TrustedNumber: #{value} (base: #{@base})"
  end

  def about
    "TrustedNumber: #{value}|base:#{@base}|pre:#{@predot}|post:#{@postdot}"
  end

  private

  def create_new_tnumber(pre, post)
    pre_clean = pre.gsub(/^0+(?=\d)/, "")
    pre_clean = ZERO if pre_clean.empty?

    post_clean = post.gsub(/0+$/, "")
    str_number = post_clean.empty? ? pre_clean : "#{pre_clean}.#{post_clean}"
    TrustedNumber.new(str_number, base: @base)
  end

  def fill_pre_and_post
    num_str = @number.to_s.downcase.delete(" ")
    pre, post = num_str.split(DOT)

    pre&.gsub!(/\A0+/, "")
    @predot = if pre.nil? || pre == ""
      ZERO
    else
      pre
    end

    post&.sub!(/0+\z/, "")
    @postdot = if post.nil? || post == ""
      ZERO
    else
      post
    end
  end

  def validate_format
    allowed = DIGITS[0...@base]
    pattern = /\A[#{allowed}]*\z/
    unless @predot.match?(pattern) && @postdot.match?(pattern)
      raise ArgumentError, "Caracteres inválidos para base #{@base}"
    end
  end
end
