#!/usr/bin/env ruby

require_relative "../lib/trusted-number"

samples = {
  10 => ["0120.0", -0.010],
  2 => ["0101.00", -01110],
  16 => ["0ab.c0", "-0ab0.0e0"]
}

samples.each_pair do |base, values|
  puts "base #{base}"
  values.each do |value|
    num = TrustedNumber.new(value, base: base)

    print "#{value} ".rjust(12)
    puts "==> #{num.inspect}"
  end
end
