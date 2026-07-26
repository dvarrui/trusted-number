#!/usr/bin/env ruby
require_relative "../lib/trusted-number"
require_relative "line"

b2 = TrustedNumber.factory(2)
b10 = TrustedNumber.factory(10)
b16 = TrustedNumber.factory(16)

line(eol: false)
num1 = b10.call(0.1)
num2 = b10.call("0.2")
print "Example (base #{num1.base}): #{num1.value} + #{num2.value} == "
puts num1 + num2

line(eol: false)
num1 = b2.call("101.1")
num2 = b2.call(0.1)
print "Example (base #{num1.base}): #{num1.value} + #{num2.value} == "
puts num1 + num2

line(eol: false)
num1 = b10.call(3.1415)
num2 = b10.call(10)
print "Example (base #{num1.base}): #{num1.value} + #{num2.value} == "
puts num1 + num2

line(eol: false)
num1 = b16.call("af")
num2 = b16.call(2)
print "Example (base #{num1.base}): #{num1.value} + #{num2.value} == "
puts num1 + num2

line(eol: false)
