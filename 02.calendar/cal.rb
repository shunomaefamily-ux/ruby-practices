require 'date'
require "optparse"
Option_Year=Date.today.year
Option_Month=Date.today.month
opts = OptionParser.new
opts.on("-y", "--year N1", Integer){|w1|
  Option_Year = w1
}
opts.on("-m", "--month N2", Integer){|w2|
  Option_Month = w2
}
opts.parse!(ARGV)
a=Date.new(Option_Year, Option_Month, 1)
Month_and_Year = a.strftime('%B')+" "+"#{a.year}"
puts Month_and_Year.center(20)
puts "Su Mo Tu We Th Fr Sa"
a.cwday.times do
  print"   "
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
