#!/usr/bin/env ruby

require_relative "../lib/trusted-number"

number = TNumber.new("012.340")

puts "Original    | #{number}"

number.move_dot -2 
puts "Move dot -2 | #{number}"

number.move_dot -1 
puts "Move dot -1 | #{number}"

number.move_dot 6 
puts "Move dot  6 | #{number}"

number.move_dot -3
puts "Move dot -3 | #{number}"