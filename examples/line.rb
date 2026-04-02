def line(nl: true)
  prefix = ""
  suffix = ""
  if nl
    prefix = "\n"
    suffix = "\n\n"
  end
  puts prefix + "-" * 70 + suffix
end
