#!/usr/bin/env ruby
require_relative "../lib/trusted-number"
require_relative "line"

line
num1 = TrustedNumber.new("0.1")
num2 = TrustedNumber.new("0.2")
print "Example (base #{num1.base}): #{num1.value} + #{num2.value} == "
puts num1 + num2

line
num1 = TrustedNumber.new("101.1", base: 2)
num2 = TrustedNumber.new("0.1", base: 2)
print "Example (base #{num1.base}): #{num1.value} + #{num2.value} == "
puts num1 + num2

line
num1 = TNumber.new(3.1415)
num2 = TNumber.new(10)
print "Example (base #{num1.base}): #{num1.value} + #{num2.value} == "
puts num1 + num2

line
num1 = TNumber.new("af", base: 16)
num2 = TNumber.new(2, base: 16)
print "Example (base #{num1.base}): #{num1.value} + #{num2.value} == "
puts num1 + num2