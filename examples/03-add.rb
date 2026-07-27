#!/usr/bin/env ruby
require_relative "../lib/trusted-number"

num1 = TrustedNumber.new("101.1", base: 2)
num2 = TrustedNumber.new("0.1", base: 2)

puts "Example: #{num1} + #{num2}"
res = num1 + num2
puts "Result: #{res}"
puts 

num1 = TrustedNumber.new("111.11", base: 2)
num2 = TrustedNumber.new("0.01", base: 2)

puts "Example: #{num1} + #{num2}"
res = num1 + num2
puts "Result: #{res}"
puts 

num1 = TrustedNumber.new("0.1")
num2 = TrustedNumber.new("0.2")

puts "Example: #{num1} + #{num2}"
res = num1 + num2
puts "Result: #{res}"
puts 

num1 = TrustedNumber.new("99.99")
num2 = TrustedNumber.new("0.01")

puts "Example: #{num1} + #{num2}"
res = num1 + num2
puts "Result: #{res}"
