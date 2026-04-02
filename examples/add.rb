#!/usr/bin/env ruby
require_relative "../lib/trusted-number"
require_relative "line"

line
num1 = TrustedNumber.new("101.1", base: 2)
num2 = TrustedNumber.new("0.1", base: 2)

puts "Example: #{num1.value} + #{num2.value}"
puts "Base: #{num1.base}"
res = num1 + num2
puts "Result: #{res.value}"
puts res.about

line
num1 = TrustedNumber.new("0.1")
num2 = TrustedNumber.new("0.2")

puts "Example: #{num1.value} + #{num2.value}"
puts "Base: #{num1.base}"
res = num1 + num2
puts "Result: #{res.value}"
puts res.about

line
