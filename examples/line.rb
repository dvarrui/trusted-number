def line(eol: true)
  prefix = ""
  suffix = ""
  if eol
    prefix = "\n"
    suffix = "\n\n" 
  end
  puts prefix + "-" * 60 + suffix
end
