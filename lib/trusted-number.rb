# frozen_string_literal: true

require_relative "trusted-number/add"
require_relative "trusted-number/compare"
require_relative "trusted-number/mul"
require_relative "trusted-number/version"

class TrustedNumber
  attr_reader :base
  attr_reader :predot, :postdot

  DIGITS = "0123456789abcdefghijklmnopqrstuvwxyz"
  ZERO = "0"
  DOT = "."

  def initialize(number, base: 10)
    @number = number.chomp
    @base = base

    fill_attibutes(@number)
    validate_format
  end

  def value
    number = if @postdot == ZERO
      @predot
    else
      "#{@predot}#{DOT}#{@postdot}"
    end
    base = "(b#{@base})"
    base = "" if @base == 10
    "#{@sign}#{number}#{base}"
  end

  def to_s
    value
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

  def fill_attibutes(number)
    num_str = number.to_s.downcase.delete(" ")
    num_str = fill_sign(num_str)

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

  def fill_sign(number)
    @sign = ""
    if number.start_with?("-")
      @sign = "-"
      number = number[1..]
    end
    number
  end

  def validate_format
    allowed = DIGITS[0...@base]
    pattern = /\A[#{allowed}]*\z/
    unless @predot.match?(pattern) && @postdot.match?(pattern)
      raise ArgumentError, "Invalid chars (base #{@base})"
    end
  end
end
