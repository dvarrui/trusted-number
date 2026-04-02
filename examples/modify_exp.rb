#!/usr/bin/env ruby
require_relative "../lib/trusted-number"

def show(title, num)
  puts "==> #{title}: #{num}"
  puts "  mant : #{num.mant}"
  puts "  exp  : #{num.exp}"
end

num = TrustedNumber.new(1200)
show("Original number", num)

num.down_exp_to!(-1)
show("down exp to -1", num)

num.down_exp_to!(-1)
show("down exp to -1 again", num)

num.up_exp_to!(2)
show("up exp to 2", num)

num.move_exp_to!(0)
show("move exp to 0", num)
