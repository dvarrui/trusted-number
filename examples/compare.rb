#!/usr/bin/env ruby
require_relative "../lib/trusted-number"

def line
  puts "\n" + "-" * 40
end

num1 = TrustedNumber.new("0")
num2 = TrustedNumber.new("0.2")
num3 = TrustedNumber.new("3.0")
num4 = TrustedNumber.new("4.5")

line
puts "Example:"
puts "-  #{num1.value} == #{num2.value} => #{num1 == num2}"
puts "-  #{num1.value} >  #{num2.value} => #{num1 > num2}"
puts "-  #{num1.value} <  #{num2.value} => #{num1 < num2}"

line
puts "Example:"
puts "-  #{num2.value} == #{num3.value} => #{num2 == num3}"
puts "-  #{num2.value} >  #{num3.value} => #{num2 > num3}"
puts "-  #{num2.value} <  #{num3.value} => #{num2 < num3}"

line
puts "Example:"
puts "-  #{num4.value} == #{num3.value} => #{num4 == num3}"
puts "-  #{num4.value} >  #{num3.value} => #{num4 > num3}"
puts "-  #{num4.value} <  #{num3.value} => #{num4 < num3}"
