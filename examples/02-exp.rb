#!/usr/bin/env ruby

require_relative "../lib/trusted-number"

number = TNumber.new("012.3450")
puts "Original    | #{number}"

number.move_dot -2 
puts "Move dot -2 | #{number}"

number.move_dot -1 
puts "Move dot -1 | #{number}"

number.move_dot 6 
puts "Move dot  6 | #{number}"

number.move_dot -3
puts "Move dot -3 | #{number}"

number.move_dot :left
puts "Move dot left | #{number}"

number.move_dot :right
puts "Move dot right | #{number}"

number.move_dot :sci
puts "Move dot sci | #{number}"
