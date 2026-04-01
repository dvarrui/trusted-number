#!/usr/bin/env ruby
require_relative "../lib/trusted-number"
require "debug"

def line
  puts "\n" + "-" * 40
end

num1 = TrustedNumber.new("0")
num2 = TrustedNumber.new("0.1")
num3 = TrustedNumber.new("1.0")
num4 = TrustedNumber.new("1.1")

line
puts "Example: #{num1.value} == #{num1.value}"
puts (num1 == num1)

line
puts "Example: #{num1.value} == #{num2.value}"
puts (num1 == num2)

line
puts "Example: #{num2.value} == #{num3.value}"
puts (num2 == num3)

line
puts "Example: #{num3.value} == #{num4.value}"
puts (num3 == num4)