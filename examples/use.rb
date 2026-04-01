#!/usr/bin/env ruby

require_relative "../lib/trusted-number"

num1 = TrustedNumber.new("0.1")
num2 = TrustedNumber.new("0.2")

print " 0.1 + 0.2 = "
puts num1 + num2 #=> 0.3