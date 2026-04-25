require 'date'
a=Date.new(1997, 2, 1)
a.cwday.times do
  print"  "
end
days_in_month = a.next_month.jd - a.jd
days_in_month.times do
  if a.day<10
    print " "
  end
  if a.cwday==6
  puts "#{a.day}"
    elsif a.day==days_in_month
    puts "#{a.day}"
    else
    print "#{a.day}"+" "
  end
  a+=1
end
